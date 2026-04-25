package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.model.ItemImage;
import com.claimit.model.User;
import com.claimit.services.ItemImageService;
import com.claimit.services.ItemService;
import com.claimit.services.UserService;

/**
 * Servlet implementation class ViewDetailsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ViewDetails" })
public class ViewDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemService itemService=new ItemService();
	private UserService userService=new UserService();
	private ItemImageService itemImageService=new ItemImageService();
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/protected_pages/ViewDetails.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		Item item= itemService.getItemById(itemId);
		String itemPostUserId= String.valueOf(item.getUserId());
		User user=userService.getUserByID(itemPostUserId);
		List<ItemImage> itemImages= itemImageService.getImagesByItemId(itemId);
		request.setAttribute("item", item);
		request.setAttribute("user",user);
		request.setAttribute("itemImages", itemImages);
		request.getRequestDispatcher("/WEB-INF/protected_pages/ViewDetails.jsp").forward(request, response);
	}

}
