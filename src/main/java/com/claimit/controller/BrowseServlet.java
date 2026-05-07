package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.enums.ItemStatus;
import com.claimit.model.Claim;
import com.claimit.model.Item;
import com.claimit.model.ItemImage;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemImageService;
import com.claimit.services.ItemReportService;
import com.claimit.services.ItemService;
import com.claimit.services.NotificationService;
import com.claimit.utils.SessionManager;

@WebServlet(asyncSupported = true, name = "Browse", urlPatterns = { "/Browse" })
public class BrowseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ItemService itemService = new ItemService();
    private final ItemImageService itemImageService=new ItemImageService();
    private final ItemReportService itemReportService = new ItemReportService();
    private final ClaimService claimService = new ClaimService();
    private final NotificationService notificationService=new NotificationService();

    public BrowseServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword   = request.getParameter("keyword");
        String dateRange = request.getParameter("dateRange");

        List<Item> allItems = itemService.getAllItems().reversed();
        List<Claim> claim   = claimService.getAllClaims();

        List<Item> filtered = new ArrayList<>();
        long now = System.currentTimeMillis();

        for (Item item : allItems) {

            // keyword filter (title, category, location)
            boolean matchesKeyword = true;
            if (keyword != null && !keyword.trim().isEmpty()) {
                String kw = keyword.trim().toLowerCase();
                matchesKeyword =
                    (item.getTitle()    != null && item.getTitle().toLowerCase().contains(kw)) ||
                    (item.getCategory() != null && item.getCategory().toLowerCase().contains(kw)) ||
                    (item.getLocation() != null && item.getLocation().toLowerCase().contains(kw));
            }

            // date range filter
            boolean matchesDate = true;
            if (dateRange != null && !dateRange.trim().isEmpty()) {
                try {
                    int days = Integer.parseInt(dateRange.trim());
                    long cutoff = now - (long) days * 24 * 60 * 60 * 1000;
                    matchesDate = item.getLostFoundDate() != null &&
                                  item.getLostFoundDate().getTime() >= cutoff;
                } catch (NumberFormatException e) {
                    matchesDate = true;
                    System.err.println("[BrowseServlet] Invalid dateRange value: '" + dateRange + "' — ignoring date filter.");
                } catch (NullPointerException e) {
                    matchesDate = false;
                    System.err.println("[BrowseServlet] Item ID " + item.getItemId() + " has null lostFoundDate.");
                }
            }

            if (matchesKeyword && matchesDate) {
                filtered.add(item);
            }
        }

        // resultCount (FOUND items only) for the JSP result bar
        int resultCount = 0;
        for (Item item : filtered) {
            if ("FOUND".equals(item.getType()) && item.getStatus().equals(ItemStatus.APPROVED.name())) {
                resultCount++;
            }
        }

        Map<Integer, List<ItemImage>> itemImagesMap = new HashMap<>();
        for (Item item : filtered) {
            List<ItemImage> images = itemImageService.getImagesByItemId(item.getItemId());
            itemImagesMap.put(item.getItemId(), images);
        }

        request.setAttribute("items",         filtered);
        request.setAttribute("claim",         claim);
        request.setAttribute("resultCount",   resultCount);     
        request.setAttribute("itemImagesMap", itemImagesMap);    

        request.getRequestDispatcher("/WEB-INF/protected_pages/users/Browse.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId = (Integer) SessionManager.getAttribute(request, "userId");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        String itemIdStr = request.getParameter("itemId");
        String reason    = request.getParameter("reason");

        if (itemIdStr == null || itemIdStr.isEmpty() || reason == null || reason.trim().isEmpty()) {
            SessionManager.setAttribute(request, "flashMessage", "Invalid report. Please try again.");
            response.sendRedirect(request.getContextPath() + "/Browse");
            return;
        }

        int itemId = Integer.parseInt(itemIdStr);
        String flashMessage = itemReportService.insertItemReport(itemId, userId, reason);
        notificationService.insertNotification(userId, "Reported Item", "You have reported an item with itemId :"+itemId+" with reason which is "+reason);
        SessionManager.setAttribute(request, "flashMessage", flashMessage);
        response.sendRedirect(request.getContextPath() + "/Browse");
    }
}