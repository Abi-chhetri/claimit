package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.services.ItemService;

/**
 * Servlet implementation class BrowseServlet
 */
@WebServlet(asyncSupported = true, name = "Browse", urlPatterns = { "/Browse" })
public class BrowseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ItemService itemService = new ItemService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Item> items = itemService.getAllItems();
		request.setAttribute("items", items);
		request.getRequestDispatcher("/WEB-INF/protected_pages/Browse.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
