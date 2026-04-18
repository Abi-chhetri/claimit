package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.User;
import com.claimit.services.UserService;

/**
 * Servlet implementation class ManageUserServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ManageUser" })
public class ManageUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService userService=new UserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users=userService.getAllUser();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/WEB-INF/protected_pages/manage-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
