package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.services.ItemService;

@WebServlet(asyncSupported = true, name = "ManageItem", urlPatterns = { "/ManageItem" })
public class ManageItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ItemService itemService = new ItemService();

	public ManageItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = request.getParameter("search");
		String status = request.getParameter("status");

		// blank strings as null
		if (search != null && search.trim().isEmpty())
			search = null;
		if (status != null && status.trim().isEmpty())
			status = null;

		// rejectItemId — which row to show the reject form on
		String rejectItemIdStr = request.getParameter("rejectItemId");
		Integer rejectItemId = null;
		if (rejectItemIdStr != null && !rejectItemIdStr.trim().isEmpty()) {
			try {
				rejectItemId = Integer.parseInt(rejectItemIdStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		List<Item> items = itemService.getAllItems().reversed();

		// Filter by status
		if (status != null) {
			List<Item> filtered = new ArrayList<>();
			for (Item item : items) {
				if (item.getStatus().equalsIgnoreCase(status)) {
					filtered.add(item);
				}
			}
			items = filtered;
		}

		// Filter by search (matches item ID or title, case-insensitive)
		if (search != null) {
			String searchLower = search.trim().toLowerCase();
			List<Item> filtered = new ArrayList<>();
			for (Item item : items) {
				if (String.valueOf(item.getItemId()).contains(searchLower)
						|| item.getTitle().toLowerCase().contains(searchLower)) {
					filtered.add(item);
				}
			}
			items = filtered;
		}

		// send to JSP
		request.setAttribute("items", items);
		request.setAttribute("search", search != null ? search : "");
		request.setAttribute("statusFilter", status != null ? status : "");
		request.setAttribute("rejectItemId", rejectItemId);

		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-item.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String itemIdStr = request.getParameter("itemId");

		if (action != null && itemIdStr != null) {
			try {
				int itemId = Integer.parseInt(itemIdStr);

				if ("approve".equals(action)) {
					itemService.approveItem(itemId);

				} else if ("reject".equals(action)) {
					String reason = request.getParameter("reason");
					itemService.rejectItem(itemId, reason);
				}

			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		//After this same as doGet method 
		String search = request.getParameter("search");
		String status = request.getParameter("status");

		if (search != null && search.trim().isEmpty())
			search = null;
		if (status != null && status.trim().isEmpty())
			status = null;

		List<Item> items = itemService.getAllItems().reversed();

		if (status != null) {
			List<Item> filtered = new ArrayList<>();
			for (Item item : items) {
				if (item.getStatus().equalsIgnoreCase(status)) {
					filtered.add(item);
				}
			}
			items = filtered;
		}

		if (search != null) {
			String searchLower = search.trim().toLowerCase();
			List<Item> filtered = new ArrayList<>();
			for (Item item : items) {
				if (String.valueOf(item.getItemId()).contains(searchLower)
						|| item.getTitle().toLowerCase().contains(searchLower)) {
					filtered.add(item);
				}
			}
			items = filtered;
		}
		request.setAttribute("items", items);
		request.setAttribute("search", search != null ? search : "");
		request.setAttribute("statusFilter", status != null ? status : "");
		request.setAttribute("rejectItemId", null);

		request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-item.jsp").forward(request, response);
	}
}