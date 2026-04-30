package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.model.User;
import com.claimit.services.ItemReportService;
import com.claimit.services.ItemService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class BrowseServlet
 */
@WebServlet(asyncSupported = true, name = "Browse", urlPatterns = { "/Browse" })
public class BrowseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ItemService itemService = new ItemService();
	private final ItemReportService itemReportService=new ItemReportService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Item> items = itemService.getAllItems().reversed();
		request.setAttribute("items", items);
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/Browse.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId =(Integer) SessionManager.getAttribute(request, "userId");
        if (userId == null ) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        String itemIdStr = request.getParameter("itemId");
        String reason    = request.getParameter("reason");

        if (itemIdStr == null || itemIdStr.isEmpty() || reason == null || reason.trim().isEmpty()) {
            SessionManager.setAttribute(request,"flashMessage", "Invalid report. Please try again.");
            response.sendRedirect(request.getContextPath() + "/Browse");
            return;
        }

        int itemId = Integer.parseInt(itemIdStr);
        String flashMessage=itemReportService.insertItemReport(itemId, userId, reason);
        SessionManager.setAttribute(request,"flashMessage", flashMessage);
        response.sendRedirect(request.getContextPath() + "/Browse");
    }

}
