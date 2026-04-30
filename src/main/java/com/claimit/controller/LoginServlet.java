package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.enums.*;
import com.claimit.model.Admin;
import com.claimit.model.User;
import com.claimit.services.AdminService;
import com.claimit.services.UserService;
import com.claimit.utils.CookieManager;
import com.claimit.utils.HashPasswordUtil;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// if already logged in via session
		Integer userId = (Integer) SessionManager.getAttribute(request, "userId");
		Integer adminId = (Integer) SessionManager.getAttribute(request, "adminId");

		if (userId != null) {
			response.sendRedirect(request.getContextPath() + "/DashBoard");
			return;
		}
		if (adminId != null) {
			response.sendRedirect(request.getContextPath() + "/AdminDashBoard");
			return;
		}

		// check cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userId")) {
					try {
						int cookieUserId = Integer.parseInt(cookie.getValue());
						SessionManager.setAttribute(request, "userId", cookieUserId);
						response.sendRedirect(request.getContextPath() + "/DashBoard");
						return;
					} catch (NumberFormatException e) {
						// invalid, ignore
					}
				} else if (cookie.getName().equals("adminId")) {
					try {
						int cookieAdminId = Integer.parseInt(cookie.getValue());
						SessionManager.setAttribute(request, "adminId", cookieAdminId);
						response.sendRedirect(request.getContextPath() + "/AdminDashBoard");
						return;
					} catch (NumberFormatException e) {
						// invalid, ignore
					}
				}
			}
		}

		request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();

		User user = userService.getUserByEmail(email);
		if (user == null) {
			Admin admin = adminService.getAdminByEmail(email);
			
			if(admin == null) {
				request.setAttribute("error msg", "Account Not found !");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}

			if (admin.getStatus().equals(ActivityStatus.INACTIVE.name())) {
				request.setAttribute("error msg", "Your account has not been approved. Please Try again later !");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}

			if (admin.getStatus().equals(ActivityStatus.SUSPENDED.name())) {
				request.setAttribute("error msg", "Your account has been Suspended.");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}
			
			String encryptedPassword= admin.getPassword();
			if(HashPasswordUtil.checkPassword(password, encryptedPassword)) {
				SessionManager.setAttribute(request, "adminId", admin.getAdminId());
				SessionManager.setAttribute(request,"flashMessage", "Successfully Logged In");
				CookieManager.addCookie(response, "adminId", String.valueOf(admin.getAdminId()), 60*60);
//				CookieManager.addCookie(response, "role", admin.getRole(), 60*60);
				response.sendRedirect(request.getContextPath()+"/AdminDashBoard");
				return;
			}
			
			request.setAttribute("error msg", "Incorrect Password");
			request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);

		} else {

			if (user.getApproveStatus().equals(RegistrationStatus.PENDING.name())) {
				request.setAttribute("error msg", "Your account has not been approved. Please Try again later !");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}

			if (user.getApproveStatus().equals(RegistrationStatus.SUSPENDED.name())) {
				request.setAttribute("error msg", "Your account has been Suspended.");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}

			if (user.getApproveStatus().equals(RegistrationStatus.REJECTED.name())) {
				request.setAttribute("error msg", "Your account Registration has been Rejected.");
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}

			String encryptedPassword = user.getPassword();
			if (HashPasswordUtil.checkPassword(password, encryptedPassword)) {
				SessionManager.setAttribute(request, "userId", user.getUserId());
				SessionManager.setAttribute(request,"flashMessage", "Successfully Logged In");
				CookieManager.addCookie(response, "userId", String.valueOf(user.getUserId()), 60*60);
				userService.updateUserStatusOnly(user.getUserId(), ActivityStatus.ACTIVE.name());
				response.sendRedirect(request.getContextPath()+"/DashBoard");
				return;
			}
			request.setAttribute("error msg", "Incorrect Password");
			request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
		}

	}

}
