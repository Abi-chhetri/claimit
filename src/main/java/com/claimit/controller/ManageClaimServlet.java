package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.model.Claim;
import com.claimit.services.ClaimService;

/**
 * Servlet implementation class ManageClaimServlet
 */
@WebServlet("/ManageClaim")
public class ManageClaimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClaimService claimServices=new ClaimService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageClaimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Claim> claims=(List<Claim>) claimServices.getAllClaims().reversed();
		HashMap <Integer,Double> approvedClaim = claimServices.getApprovedClaims();
		Map.Entry<Integer, Double> approvedEntry = approvedClaim.entrySet().iterator().next();
		request.setAttribute("claims", claims);
		request.setAttribute("approvedCount", approvedEntry.getKey());
		request.setAttribute("approvedPercentage", approvedEntry.getValue());
		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-claim.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
