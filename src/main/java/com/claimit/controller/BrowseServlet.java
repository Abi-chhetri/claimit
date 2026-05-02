package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.claimit.model.Claim;
import com.claimit.model.Item;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemReportService;
import com.claimit.services.ItemService;
import com.claimit.utils.SessionManager;

@WebServlet(asyncSupported = true, name = "Browse", urlPatterns = { "/Browse" })
public class BrowseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ItemService itemService = new ItemService();
    private final ItemReportService itemReportService = new ItemReportService();
    private final ClaimService claimService = new ClaimService();

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
                    /*
                     * Calculate the cutoff timestamp by subtracting X days (converted to milliseconds)
                     * from the current time. Formula: days × 24hrs × 60min × 60sec × 1000ms
                     * Any item whose lostFoundDate.getTime() >= cutoff falls within the selected range.
                     */
                    long cutoff = now - (long) days * 24 * 60 * 60 * 1000;
                    matchesDate = item.getLostFoundDate() != null &&
                                  item.getLostFoundDate().getTime() >= cutoff; // getTime() returns the item's date as milliseconds
                } catch (NumberFormatException e) {
                    matchesDate = true; // skip date filter
                    System.err.println("[BrowseServlet] Invalid dateRange value: '" + dateRange + "' — ignoring date filter.");
                } catch (NullPointerException e) {
                    matchesDate = false; // item.getLostFoundDate() is null then exclude from results
                    System.err.println("[BrowseServlet] Item ID " + item.getItemId() + " has null lostFoundDate.");
                }
            }

            if (matchesKeyword && matchesDate) {
                filtered.add(item);
            }
        }

        request.setAttribute("items", filtered);
        request.setAttribute("claim", claim);
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
        SessionManager.setAttribute(request, "flashMessage", flashMessage);
        response.sendRedirect(request.getContextPath() + "/Browse");
    }
}