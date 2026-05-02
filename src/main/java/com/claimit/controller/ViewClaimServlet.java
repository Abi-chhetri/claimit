package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.model.Claim;
import com.claimit.model.Item;
import com.claimit.model.User;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemService;
import com.claimit.services.UserService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class ViewClaimServlet
 */
@WebServlet(asyncSupported = true, name = "ViewClaim", urlPatterns = { "/ViewClaim" })
public class ViewClaimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ClaimService claimService=new ClaimService();
	private final UserService userService=new UserService();
	private final ItemService itemService=new ItemService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewClaimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int claimId= Integer.parseInt(request.getParameter("claimId"));
		Claim claim=claimService.getClaimById(claimId);
		User user= userService.getUserByID(String.valueOf(claim.getUserId()));
		Item item= itemService.getItemById(claim.getItemId());
		request.setAttribute("claim", claim);
		request.setAttribute("user", user);
		request.setAttribute("item", item);
		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/view-claim.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String action = request.getParameter("action");
	    String claimId = request.getParameter("claimId");
	    String adminNotes = request.getParameter("adminNotes");
	    
	    // First step: load attributes, set form flags, THEN forward once
	    int id = Integer.parseInt(claimId);
	    Claim claim = claimService.getClaimById(id);
	    User user = userService.getUserByID(String.valueOf(claim.getUserId()));
	    Item item = itemService.getItemById(claim.getItemId());

	    if (adminNotes != null) {
	        String pendingAction = request.getParameter("pendingAction");
	        int adminId = (Integer) SessionManager.getAttribute(request, "adminId");
	        claimService.updateClaimStatus(Integer.parseInt(claimId), pendingAction, adminNotes, adminId, item.getItemId());
	        response.sendRedirect(request.getContextPath() + "/ManageClaim");
	        return;
	    }

	    request.setAttribute("claim", claim);
	    request.setAttribute("user", user);
	    request.setAttribute("item", item);
	    request.setAttribute("showNotesForm", true);
	    request.setAttribute("pendingAction", action);

	    request.getRequestDispatcher("/WEB-INF/protected_pages/admins/view-claim.jsp")
	           .forward(request, response);
	}
}
