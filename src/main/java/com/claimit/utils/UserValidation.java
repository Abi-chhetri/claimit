package com.claimit.utils;

import com.claimit.services.UserService;

public class UserValidation {
	
	private static UserService userService =new UserService();
	//this is the regex code that can check if (the string contains special characters and 0-9 any one numbers ) or not
	private static String regex= "(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=\\[\\]{}]).*";
	

	/*
	 * this method validate users based on password check and null check or required fields 
	 * if this method returns null that means the user data is valid can now it can be used for further process
	 */
	public static String validate(String fullName, String email, String password, String confirmPassword, String terms) {
        
        if (fullName == null || email == null || password == null || terms == null) {
            return "Please fill all required fields!";
        }
        if (password.length() < 8) {
            return "Password must be at least 8 characters.";
        }
        if (!password.matches(regex)) { //matches password against regex string
            return "Password must contain number and special character.";
        }
        if (!password.equals(confirmPassword)) {
            return "Please ensure both passwords are identical.";
        }
        if(userService.getUserByEmail(email) != null) {
        	return "An account with this email already exists. Please use a different email.";
        }

        return null; 
    }
	
}
