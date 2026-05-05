package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.AdminLog;
import com.claimit.services.AdminLogService;

/**
 * Servlet implementation class AdminLogServlet
 */
@WebServlet(asyncSupported = true, name = "AdminLog", urlPatterns = { "/AdminLog" })
public class AdminLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AdminLogService adminLogService=new AdminLogService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AdminLog> logs= adminLogService.getAllAdminLogs().reversed();
		request.setAttribute("logs", logs);
		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/admin-log.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
