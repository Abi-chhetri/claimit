package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.services.ContactMessageService;
import com.claimit.utils.SessionManager;

/**
 * Servlet implementation class AboutServlet
 */
@WebServlet(asyncSupported = true, name = "About", urlPatterns = { "/About" })
public class AboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ContactMessageService contactMessageServices=new ContactMessageService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AboutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId=(Integer) SessionManager.getAttribute(request, "userId");
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/public_pages/AboutUs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String message= request.getParameter("message");
		Integer userId = (Integer) SessionManager.getAttribute(request, "userId");
		String erMsg="";
		
		//validation
		if(userId==null) {
			if (email == null || email.isEmpty() || message == null || message.isEmpty()) {
			    erMsg = "Please fill all the fields";
			    request.setAttribute("erMsg", erMsg);
			    request.getRequestDispatcher("/public_pages/AboutUs.jsp").forward(request, response);
			    return;
			}
		}else {
			if(message == null || message.isEmpty()) {
				erMsg="Please fill all the field";
				request.setAttribute("erMsg", erMsg);
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/public_pages/AboutUs.jsp").forward(request, response);
				return;
			}
		}
		
		boolean res= contactMessageServices.insertContactMessage(userId, email, message);
		
		if(res) {
			request.setAttribute("suc", "Thank you for contacting us. We will take action shortly regarding your issue.");
		}
		request.setAttribute("erMsg", "We couldn't process your request at the moment. Please try again later.");
		request.getRequestDispatcher("/public_pages/AboutUs.jsp").forward(request, response);
	}

}
