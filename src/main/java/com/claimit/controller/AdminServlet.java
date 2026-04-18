package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.model.Admin;
import com.claimit.services.AdminService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminDashBoard" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService=new AdminService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
			request.setAttribute("admin", admin);
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
