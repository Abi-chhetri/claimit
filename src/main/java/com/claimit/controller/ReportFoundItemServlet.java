package com.claimit.controller;

import com.claimit.model.Item;
import com.claimit.services.ItemImageService;
import com.claimit.services.ItemService;
import com.claimit.utils.ImageUploadUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@MultipartConfig(maxFileSize = 20*1024*1024, maxRequestSize = 100*1024*1024)
@WebServlet(asyncSupported = true, urlPatterns = { "/ReportFoundItem" })
public class ReportFoundItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final ItemService itemService = new ItemService();
    private final ItemImageService itemImageService=new ItemImageService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/Report_Found_Item.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String itemName = request.getParameter("item-name");
	    String description = request.getParameter("description");
	    String dateFound = request.getParameter("date-found");
	    String locationFound = request.getParameter("location_found");
	    String category = request.getParameter("category");

	    if (itemName == null || itemName.trim().isEmpty()
	            || description == null || description.trim().isEmpty()
	            || dateFound == null || dateFound.trim().isEmpty()
	            || locationFound == null || locationFound.trim().isEmpty()
	            || category == null || category.trim().isEmpty()) {

	        request.setAttribute("error", "All fields are required.");
	        request.getRequestDispatcher("/WEB-INF/protected_pages/users/Report_Found_Item.jsp")
	               .forward(request, response);
	        return;
	    }

	    // get logged in user id from session
	    int userId = (int) request.getSession().getAttribute("userId");

	    Item item = new Item();
	    item.setUserId(userId);
	    item.setType("FOUND");
	    item.setTitle(itemName);
	    item.setCategory(category);
	    item.setDescription(description);
	    item.setLocation(locationFound);
	    item.setLostFoundDate(Date.valueOf(dateFound));
	    item.setStatus("PENDING");
	    
	    int itemId = itemService.insertItem(item);

	    if (itemId == -1) {
	        request.setAttribute("msg", "Failed to save item. Please try again.");
	        request.getRequestDispatcher("/WEB-INF/protected_pages/users/Report_Found_Item.jsp")
	               .forward(request, response);
	        return;
	    }

	    // upload images and save to DB only if user attached any
	    ImageUploadUtil imageUtil = new ImageUploadUtil();
	    String rootPath = getServletContext().getRealPath("/uploads");
	    List<String> uploadedImages = imageUtil.uploadMultipleImages(request, rootPath, "found_items");
	    
	    if (!uploadedImages.isEmpty()) {
	        boolean imagesSaved = itemImageService.insertImages(itemId, uploadedImages);
	        if (!imagesSaved) {
	            request.setAttribute("msg", "Item saved but images failed to upload.");
	        } else {
	            request.setAttribute("msg", "Item reported successfully.");
	        }
	    } 
	    else {
            request.setAttribute("msg", "Item reported successfully without image.");
        }

	    request.setAttribute("msg", "Item reported successfully.");
	    request.getRequestDispatcher("/WEB-INF/protected_pages/users/Report_Found_Item.jsp").forward(request, response);
	}
}