package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.services.UserService;
import com.claimit.utils.CookieManager;
import com.claimit.utils.SessionManager;
import com.claimit.enums.ActivityStatus;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Logout" })
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService =new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId= (Integer) SessionManager.getAttribute(request, "userId");
		if(userId != null) userService.updateUserStatusOnly(userId, ActivityStatus.INACTIVE.name());

		SessionManager.invalidate(request);
	    CookieManager.deleteCookie(response, "userId");
	    CookieManager.deleteCookie(response, "adminId");
		response.sendRedirect(request.getContextPath()+"/Login");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
