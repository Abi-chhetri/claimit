package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.claimit.model.Notification;
import com.claimit.model.User;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemService;
import com.claimit.services.NotificationService;
import com.claimit.services.UserService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class DashBoard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DashBoard" })
public class DashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	private ClaimService claimServices = new ClaimService();
	private ItemService itemService = new ItemService();
	private NotificationService notificationService=new NotificationService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DashBoardServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId = (Integer) SessionManager.getAttribute(request, "userId");
		if (userId == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		List<Notification>notif=notificationService.getNotificationByIdWithLim(userId);
		User user = userService.getUserByID(userId.toString()); // or change service to accept int
		request.setAttribute("user", user);

		Map<String, Integer> userClamStat = claimServices.getUserClaimStat(userId);
		for (Map.Entry<String, Integer> entry : userClamStat.entrySet()) {
			request.setAttribute(entry.getKey(), entry.getValue());
		}

		Integer userReportCount = itemService.getUserReportCount(userId);
		request.setAttribute("userReportCount", userReportCount);
		request.setAttribute("notif", notif);
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/DashBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
