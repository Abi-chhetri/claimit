package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.Admin;
import com.claimit.services.AdminLogService;
import com.claimit.services.AdminService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class ManageModeratorServlet
 */
@WebServlet(asyncSupported = true, name = "ManageModerator", urlPatterns = { "/ManageModerator" })
public class ManageModeratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService = new AdminService();
	private final AdminLogService adminLogService=new AdminLogService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageModeratorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminId = String.valueOf(SessionManager.getAttribute(request, "adminId"));
		Admin admin = adminService.getAdminByID(adminId);

		String status = request.getParameter("status");
		List<Admin> admins = adminService.getAllModerators().reversed();

		if (status != null && !status.isEmpty()) {
			List<Admin> filtered = new java.util.ArrayList<>();
			for (Admin e : admins) {
				if (e.getStatus().equalsIgnoreCase(status)) {
					filtered.add(e);
				}
			}
			admins = filtered;
			request.setAttribute("selectedStatus", status);
		}

		request.setAttribute("admins", admins);
		request.setAttribute("admin", admin);
		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-moderator.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionDb= request.getParameter("actionDb");
		String adminId=request.getParameter("adminId");
		
		if(actionDb != null ) {
			adminService.updateModStatusById(actionDb, Integer.parseInt(adminId));
			adminLogService.createAdminLog((Integer) SessionManager.getAttribute(request, "adminId"), actionDb, "Moderator Status Update", "Mod Id: "+adminId);
		}
		
		String action = request.getParameter("action");
		if (action != null && action.equals("addMod")) {
			request.setAttribute("showModal", true);
			request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-moderator.jsp").forward(request,response);
			return;
		}
		response.sendRedirect(request.getContextPath()+"/ManageModerator");
		
	}

}
