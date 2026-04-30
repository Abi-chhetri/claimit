package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.model.ItemImage;
import com.claimit.model.User;
import com.claimit.services.ClaimService;
import com.claimit.services.ItemImageService;
import com.claimit.services.ItemService;
import com.claimit.services.UserService;
import com.claimit.utils.ImageUploadUtil;

@MultipartConfig(maxFileSize = 20 * 1024 * 1024, maxRequestSize = 100 * 1024 * 1024)
@WebServlet(asyncSupported = true, urlPatterns = { "/Claims" })
public class ClaimsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ClaimService claimService = new ClaimService();
    private final ItemService itemService = new ItemService();
    private final UserService userService = new UserService();
    private final ItemImageService itemImageService = new ItemImageService();
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.doGet(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int userId = (int) request.getSession().getAttribute("userId");
        String ownershipDescription = request.getParameter("ownershipDescription");

        ImageUploadUtil imageUtil = new ImageUploadUtil();
        String rootPath = getServletContext().getRealPath("/uploads");
        List<String> uploadedImages = imageUtil.uploadMultipleImages(request, rootPath, "proof_images");

        String proofImage = uploadedImages.isEmpty() ? null : String.join(",", uploadedImages);

        String msg = claimService.insertClaim(itemId, userId, proofImage, ownershipDescription);

        Item item = itemService.getItemById(itemId);
        User user = userService.getUserByID(String.valueOf(item.getUserId()));
        List<ItemImage> itemImages = itemImageService.getImagesByItemId(itemId);

        request.setAttribute("item", item);
        request.setAttribute("user", user);
        request.setAttribute("itemImages", itemImages);
        request.setAttribute("msg", msg);

        request.getRequestDispatcher("/WEB-INF/protected_pages/users/ViewDetails.jsp").forward(request, response);
    }
}