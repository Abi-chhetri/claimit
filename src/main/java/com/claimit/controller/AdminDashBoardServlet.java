package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.claimit.model.Admin;
import com.claimit.services.AdminService;
import com.claimit.services.ClaimServices;
import com.claimit.services.ItemReportServices;
import com.claimit.services.UserService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminDashBoard" })
public class AdminDashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService=new AdminService();
	private UserService userService =new UserService();
	private ClaimServices claimServices=new ClaimServices();
	private ItemReportServices itemReportServices=new ItemReportServices();
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adminId = String.valueOf(SessionManager.getAttribute(request, "adminId"));
		if(adminId != null) {
			Admin admin=adminService.getAdminByID(adminId);
			HashMap <Integer,Double> pendingClaim = claimServices.getPendingClaims();
			HashMap <Integer,Double> approvedClaim = claimServices.getApprovedClaims();
			Map.Entry<Integer, Double> approvedEntry = approvedClaim.entrySet().iterator().next();
			Map.Entry<Integer, Double> pendingEntry = pendingClaim.entrySet().iterator().next();
			
			Integer totalItem=(Integer) claimServices.getTotalItemCount();
			Integer totalReport=(Integer) itemReportServices.getTotalItemReport();

			request.setAttribute("approvedCount", approvedEntry.getKey());
			request.setAttribute("approvedPercentage", approvedEntry.getValue());
			request.setAttribute("pendingCount", pendingEntry.getKey());
			request.setAttribute("pendingPercentage", pendingEntry.getValue());
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("totalReport", totalReport);
			
			request.setAttribute("admin", admin);
			Integer userCount=userService.getUserCount();
			request.setAttribute("userCount", userCount);

		}
		request.getRequestDispatcher("/WEB-INF/protected_pages/admin-dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
