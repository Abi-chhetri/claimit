package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.Notification;
import com.claimit.services.NotificationService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet(asyncSupported = true, name = "Notification", urlPatterns = { "/Notification" })
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final NotificationService notificationService=new NotificationService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId= (Integer) SessionManager.getAttribute(request, "userId");
		List<Notification> notification=notificationService.getNotificationByIdWithLim(userId);
		request.setAttribute("notification", notification);
		request.setAttribute("hide", false);
		request.getRequestDispatcher("WEB-INF/protected_pages/users/Notifications.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId= (Integer) SessionManager.getAttribute(request, "userId");
		List<Notification> notification=notificationService.getNotificationById(userId);
		request.setAttribute("notification", notification);
		request.setAttribute("hide", true);
		request.getRequestDispatcher("WEB-INF/protected_pages/users/Notifications.jsp").forward(request, response);
	}

}
