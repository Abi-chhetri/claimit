package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.sql.Timestamp;

import com.claimit.model.User;
import com.claimit.services.UserService;
import com.claimit.utils.HashPasswordUtil;
import com.claimit.utils.ImageUploadUtil;
import com.claimit.utils.SessionManager;

@WebServlet(asyncSupported = true, name = "UserProfile", urlPatterns = { "/UserProfile" })
@MultipartConfig
public class UserProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final UserService userService = new UserService();
	private final ImageUploadUtil imageUploadUtil = new ImageUploadUtil();

	private void loadProfile(HttpServletRequest request, HttpServletResponse response, boolean editMode)
			throws ServletException, IOException {
		String userId = String.valueOf(SessionManager.getAttribute(request, "userId"));
		request.setAttribute("user", userService.getUserByID(userId));
		request.setAttribute("editMode", editMode);
		request.getRequestDispatcher("/WEB-INF/protected_pages/users/UserProfile.jsp").forward(request, response);
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loadProfile(request, response, "edit".equals(request.getParameter("action")));
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String userId = String.valueOf(SessionManager.getAttribute(request, "userId"));
	    User user = userService.getUserByID(userId);
	    String formType = request.getParameter("formType");
	    String msg = null;
	    String msgType = "success";

	    try {
	        switch (formType) {

	        case "personalInfo":
	            String field = request.getParameter("field");
	            if ("fullName".equals(field)) {
	                user.setFullName(request.getParameter("fullName").trim());
	            } else if ("phoneNumber".equals(field)) {
	                user.setPhoneNumber(request.getParameter("phoneNumber").trim());
	            }
	            user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
	            userService.updatePersonalInfo(user);
	            msg = "Profile updated successfully.";
	            break;

	        case "profilePic":
	            Part filePart = request.getPart("profilePic");
	            if (filePart != null && filePart.getSize() > 0 && imageUploadUtil.isValidImage(filePart)) {
	                String imageName = imageUploadUtil.getImageNameFromPart(filePart);
	                imageUploadUtil.uploadImage(filePart, getServletContext().getRealPath(""), "uploads/profile-pics", imageName);
	                user.setProfilePhoto("uploads/profile-pics/" + imageName);
	                user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
	                userService.updatePersonalInfo(user);
	                msg = "Profile picture updated successfully.";
	            } else {
	                msg = "Invalid image. Please upload a JPG or PNG under 100MB.";
	                msgType = "error";
	            }
	            break;

	        case "changePassword":
	            String current = request.getParameter("current_password");
	            String newPass  = request.getParameter("new_password");
	            String confirm  = request.getParameter("confirm_password");
	            if (!HashPasswordUtil.checkPassword(current, user.getPassword())) {
	                msg = "Current password is incorrect.";
	                msgType = "error";
	            } else if (!newPass.equals(confirm)) {
	                msg = "New passwords do not match.";
	                msgType = "error";
	            } else if (newPass.length() < 8) {
	                msg = "Password must be at least 8 characters.";
	                msgType = "error";
	            } else {
	                user.setPassword(HashPasswordUtil.encryptPassword(newPass));
	                user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
	                userService.updatePersonalInfo(user);
	                msg = "Password changed successfully.";
	            }
	            break;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        msg = "Something went wrong. Please try again.";
	        msgType = "error";
	    }

	    // reload fresh user from DB so updated values show immediately
	    user = userService.getUserByID(userId);
	    request.setAttribute("user", user);
	    request.setAttribute("msg", msg);
	    request.setAttribute("msgType", msgType);
	    request.getRequestDispatcher("/WEB-INF/protected_pages/users/UserProfile.jsp").forward(request, response);
	}
}