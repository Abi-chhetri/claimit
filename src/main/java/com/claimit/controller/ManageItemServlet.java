package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.model.Item;
import com.claimit.model.ItemImage;
import com.claimit.services.AdminLogService;
import com.claimit.services.ItemImageService;
import com.claimit.services.ItemService;
import com.claimit.services.NotificationService;
import com.claimit.utils.SessionManager;

@WebServlet(asyncSupported = true, name = "ManageItem", urlPatterns = { "/ManageItem" })
public class ManageItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ItemService itemService = new ItemService();
    private final AdminLogService adminLogService = new AdminLogService();
    private final NotificationService notificationService = new NotificationService();
    private final ItemImageService imageService = new ItemImageService();

    public ManageItemServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read search and status filter from query params
        String search = request.getParameter("search");
        String status = request.getParameter("status");

        // Treat blank strings as null so filters are ignored when empty
        if (search != null && search.trim().isEmpty()) search = null;
        if (status != null && status.trim().isEmpty()) status = null;

        // Read rejectItemId — determines which row shows the inline reject form
        String rejectItemIdStr = request.getParameter("rejectItemId");
        Integer rejectItemId = null;
        if (rejectItemIdStr != null && !rejectItemIdStr.trim().isEmpty()) {
            try {
                rejectItemId = Integer.parseInt(rejectItemIdStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Fetch all items in reverse order (newest first)
        List<Item> items = itemService.getAllItems().reversed();

        // Filter by status if provided
        if (status != null) {
            List<Item> filtered = new ArrayList<>();
            for (Item item : items) {
                if (item.getStatus().equalsIgnoreCase(status)) {
                    filtered.add(item);
                }
            }
            items = filtered;
        }

        // Filter by search query — matches item ID or title (case-insensitive)
        if (search != null) {
            String searchLower = search.trim().toLowerCase();
            List<Item> filtered = new ArrayList<>();
            for (Item item : items) {
                if (String.valueOf(item.getItemId()).contains(searchLower)
                        || item.getTitle().toLowerCase().contains(searchLower)) {
                    filtered.add(item);
                }
            }
            items = filtered;
        }

        // Build a map of itemId -> first image path for display in the table
        // Since Item model has no images property, we load them here and pass as a map
        Map<Integer, String> itemImages = new HashMap<>();
        for (Item item : items) {
            List<ItemImage> images = imageService.getImagesByItemId(item.getItemId());
            if (images != null && !images.isEmpty()) {
                itemImages.put(item.getItemId(), images.get(0).getImagePath());
            }
        }

        // Send filtered items, image map, and filter state to JSP
        request.setAttribute("items", items);
        request.setAttribute("itemImages", itemImages);
        request.setAttribute("search", search != null ? search : "");
        request.setAttribute("statusFilter", status != null ? status : "");
        request.setAttribute("rejectItemId", rejectItemId);

        request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-item.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read action (approve/reject) and target item id from form
        String action = request.getParameter("action");
        String itemIdStr = request.getParameter("itemId");

        if (action != null && itemIdStr != null) {
            try {
                int itemId = Integer.parseInt(itemIdStr);

                // Fetch the item to get the userId for sending notification
                Item item = itemService.getItemById(itemId);

                if ("approve".equals(action)) {
                    // Update item status to APPROVED in database
                    itemService.updateItemStatus(itemId);

                    // Log the approve action in admin logs
                    adminLogService.createAdminLog(
                        (Integer) SessionManager.getAttribute(request, "adminId"),
                        action,
                        "Item Status " + new SimpleDateFormat("MMM dd, yyyy HH:mm:ss").format(new Date()),
                        "Item Id : " + itemId
                    );

                    // Notify the item owner that their report was approved
                    notificationService.insertNotification(
                        item.getUserId(),
                        "Item Report Found Status",
                        "Your item report has been approved"
                    );

                } else if ("reject".equals(action)) {
                    // Read rejection reason from form input
                    String reason = request.getParameter("reason");

                    // Update item status to REJECTED with reason in database
                    itemService.updateItemStatusWithReason(itemId, reason);

                    // Log the reject action in admin logs
                    adminLogService.createAdminLog(
                        (Integer) SessionManager.getAttribute(request, "adminId"),
                        action,
                        "Item Status " + new SimpleDateFormat("MMM dd, yyyy HH:mm:ss").format(new Date()),
                        "Item Id : " + itemId
                    );

                    // Notify the item owner that their report was rejected with the reason
                    notificationService.insertNotification(
                        item.getUserId(),
                        "Item Report Found Status",
                        "Your item report has been rejected , reason: " + reason
                    );
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // After action, delegate to doGet to reload the page with filters and image map
        doGet(request, response);
    }
}