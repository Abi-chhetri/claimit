package com.claimit.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

	public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name,value);
		cookie.setHttpOnly(true); // prevents JavaScript from accessing it
		cookie.setMaxAge(maxAge); //expiration time
		cookie.setPath("/claimit"); 
		response.addCookie(cookie);
	}
	
	public static Cookie getCookie(HttpServletRequest request, String name){
		Cookie cookie[]=request.getCookies();
		if(cookie != null) {
			for(Cookie eachCookie: cookie) {
				if(eachCookie.getName().equals(name)) {
					return eachCookie;
				}
			}
		}
		return null;
	}
	
	public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/claimit");
        response.addCookie(cookie);
	}
}
