package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.claimit.enums.AdminRoles;
import com.claimit.model.Admin;
import com.claimit.services.AdminLogService;
import com.claimit.services.AdminService;
import com.claimit.utils.SessionManager;
import com.claimit.utils.UserValidation;

/**
 * Servlet implementation class AdminFormServlet
 */
@WebServlet(asyncSupported = true, name = "AdminForm", urlPatterns = { "/AdminForm" })
public class AdminFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminService adminService=new AdminService();
	private final AdminLogService adminLogService=new AdminLogService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer adminId =(Integer) SessionManager.getAttribute(request, "adminId");
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm-password");
		String status = request.getParameter("status");
		
		String msg= UserValidation.validate(fullName, email, password, confirmPassword, status);
		if(msg != null) {
			request.setAttribute("selectedStatus", status);
			request.setAttribute("enteredFullName", fullName);
			request.setAttribute("enteredEmail", email);
			request.setAttribute("selectedStatus", status);
			request.setAttribute("msg", msg);
			request.setAttribute("showModal", true);
			request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-moderator.jsp").forward(request, response);
			return;
		}
		
		Admin admin=new Admin();
		admin.setFullName(fullName);
		admin.setEmail(email);
		admin.setPassword(confirmPassword);
		admin.setStatus(status);
		admin.setCreatedBy(adminId);
		admin.setRole(AdminRoles.MODERATOR.name());
		
		msg = adminService.insertModerator(admin);
		if(!msg.contains("Failed to create moderator")) {
			adminLogService.createAdminLog(adminId, "Moderator Creation", "Moderator "+new SimpleDateFormat("MMM dd, yyyy HH:mm:ss").format(new Date()), "Moderator : "+admin.getFullName());
		}
		SessionManager.setAttribute(request, "msg", msg);
		response.sendRedirect(request.getContextPath()+"/ManageModerator");
	}

}
