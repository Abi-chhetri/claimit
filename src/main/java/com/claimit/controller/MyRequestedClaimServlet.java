package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.Claim;
import com.claimit.services.ClaimService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class MyRequestedClaimServlet
 */
@WebServlet(asyncSupported = true, name = "MyRequestedClaim", urlPatterns = { "/MyRequestedClaim" })
public class MyRequestedClaimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ClaimService claimService=new ClaimService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRequestedClaimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId= (int) SessionManager.getAttribute(request, "userId");
		List<Claim> claims= claimService.getClaimByUserId(userId);
		request.setAttribute("claims", claims);
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/My_request.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
