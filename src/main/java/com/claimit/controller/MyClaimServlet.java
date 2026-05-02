package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.enums.ClaimStatus;
import com.claimit.model.Claim;
import com.claimit.services.ClaimService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class ClaimServlet
 */
@WebServlet(asyncSupported = true, name = "MyClaim", urlPatterns = { "/MyClaim" })
public class MyClaimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ClaimService claimService=new ClaimService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyClaimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId= (int) SessionManager.getAttribute(request,"userId");
		List<Claim> claim= claimService.getClaimByUserId(userId);
		int requestedClaimCount=0;
		for(Claim eachClaim: claim) {
			if(eachClaim.getClaimStatus().equals(ClaimStatus.PENDING.name()) || eachClaim.getClaimStatus().equals(ClaimStatus.IN_REVIEW.name())) {
				requestedClaimCount++;
			}
		}
		request.setAttribute("claim", claim.reversed());
		request.setAttribute("requestedClaimCount", requestedClaimCount);
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/My_Claim.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
