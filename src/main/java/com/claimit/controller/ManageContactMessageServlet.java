package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.ContactMessage;
import com.claimit.services.ContactMessageService;

/**
 * Servlet implementation class ManageContactMessageServlet
 */
@WebServlet(asyncSupported = true, name = "ManageContactMessage", urlPatterns = { "/ManageContactMessage" })
public class ManageContactMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactMessageService contactMessageService= new ContactMessageService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageContactMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ContactMessage> messages= contactMessageService.getAllMessage().reversed();
		request.setAttribute("contactMessage", messages);
		request.getRequestDispatcher("WEB-INF/protected_pages/admins/manage-contact-message.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer messageId=Integer.parseInt(request.getParameter("messageId"));
		boolean res= contactMessageService.updateReadStatusToTrue(messageId);
		if(!res) {
			request.setAttribute("suc", "Marked As read");
		}
		else {
			request.setAttribute("err", "Something went wrong");
		}
		doGet(request, response);
	}

}
