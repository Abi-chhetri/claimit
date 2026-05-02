package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.User;
import com.claimit.services.AdminService;
import com.claimit.services.UserService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class ManageUserServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ManageUser" })
public class ManageUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService userService=new UserService();
	private final AdminService adminService = new AdminService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users=userService.getAllUser().reversed();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    
	    int adminId = (Integer) SessionManager.getAttribute(request, "adminId");
	    switch(action) {
	        case "approve":
	        case "reinstate":
	            adminService.approveUser(userId, adminId);
	            break;
	        case "suspend":
	            adminService.updateUserRegistrationStatusOnly(userId, "SUSPENDED");
	            userService.updateUserStatusOnly(userId, "INACTIVE");
	            break;
	        case "reject":
	            adminService.updateUserRegistrationStatusOnly(userId, "REJECTED");
	            break;
	    }

	    response.sendRedirect(request.getContextPath() + "/ManageUser");
	}

}
