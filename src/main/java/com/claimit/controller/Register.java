package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.claimit.enums.RegistrationStatus;
import com.claimit.enums.Status;
import com.claimit.model.User;
import com.claimit.services.UserService;
import com.claimit.utils.UserValidation;

/**
 * Servlet implementation class Register.
 *this class Handles user registration requests including form validation,
 * password hashing, and forwarding to appropriate pages based on result.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user=new User();
	private UserService service=new UserService();

	//@see HttpServlet#HttpServlet()
	public Register() {
		super();
	}
	

	/**
	 * Handles the browser's default GET request, allowing the browser
	 * to interact with this servlet and serve the registration page.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/public_pages/Register.jsp").forward(request, response);
	}


	
	/**
	 * Handles the POST request submitted from the registration form.
	 * Validates user input, hashes the password, sets default status
	 * and approval fields, and forwards to login page on success
	 * or back to registration page on failure.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg=null;
		try {
			String fullName = request.getParameter("full_name").trim();
			String email = request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			String confirmPassword = request.getParameter("confirm_password").trim();
			String terms = request.getParameter("terms");

			/*
			 * this phoneNumber parameter or field is nullable user can send this field empty so this check is necessary if the null is trimmed then
			 * it might throw null pointer exception so this check was done use if-block
			 */
			String phoneNumber = null;
			if (request.getParameter("phone") != null && request.getParameter("phone").length() > 9) { 
				phoneNumber = request.getParameter("phone").trim();
			}

			//the method validate is static method from UserValidation class utils package that validates the user
			msg = UserValidation.validate(fullName, email, password, confirmPassword, terms); 

			if (msg != null) {
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("/public_pages/Register.jsp").forward(request, response);
				return;
			}

			user.setFullName(fullName);
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			user.setPassword(confirmPassword);
			user.setStatus(Status.INACTIVE.name());
			user.setApproveStatus(RegistrationStatus.PENDING.name());
			
			msg = service.insertUser(user) ;  // calling insertUser method from UserService Class 
			request.setAttribute("msg", msg);
			if (msg == "Registration pending review. We'll update you shortly.") {
				request.getRequestDispatcher("/public_pages/Login.jsp").forward(request, response);
				return;
			}
			
			request.getRequestDispatcher("/public_pages/Register.jsp").forward(request, response);
			return;
		}
		catch(NullPointerException e) {
			//if exception comes it again dispatches to the registration page with error message
			msg= "Something went wrong during registration.";
			System.err.println(e.getMessage());
			request.setAttribute("msg", msg);
	        request.getRequestDispatcher("/public_pages/Register.jsp").forward(request, response);
		}
	}

}
