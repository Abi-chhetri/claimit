package com.claimit.utils;
import org.mindrot.jbcrypt.BCrypt;

public class HashPasswordUtil {
	
	
	//This method hashes the plain password with the help of BCrypt 
	public static String encryptPassword(String plainPassword) {
		return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
	}
	
	//This method checks the hashed password against the plain password  and returns either true or false according to password
	public static boolean checkPassword(String plainPassword,String encryptedPassword) {
		return BCrypt.checkpw(plainPassword, encryptedPassword);
	}
	
	
//	//password hasher for admin
//	public static void main(String[] args) {
//	    System.out.println(encryptPassword("Admin@123"));
//	}
	
}
