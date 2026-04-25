package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

import com.claimit.model.User;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemService;
import com.claimit.services.UserService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class DashBoard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DashBoard" })
public class DashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService=new UserService();
	private ClaimService claimServices=new ClaimService();
	private ItemService itemReportServices=new ItemService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoardServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= String.valueOf(SessionManager.getAttribute(request, "userId"));
		if(userId != null) {
			User user=userService.getUserByID(userId);
			request.setAttribute("user", user);
			
			Map<String,Integer> userClamStat= claimServices.getUserClaimStat(Integer.parseInt(userId));
			for(Map.Entry<String, Integer> eachEntry: userClamStat.entrySet()) {
				request.setAttribute(eachEntry.getKey(), eachEntry.getValue());
			}
			
			Integer userReportCount= itemReportServices.getUserReportCount(Integer.parseInt(userId));
			request.setAttribute("userReportCount", userReportCount);
			
		}
		request.getRequestDispatcher("/WEB-INF/protected_pages/DashBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
