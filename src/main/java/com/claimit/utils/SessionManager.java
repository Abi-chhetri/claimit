package com.claimit.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionManager {

	public static void setAttribute(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession(); // if nothing is provided in param of getSession that means true and which mean create a session
		session.setAttribute(key, value);
	}
	
	public static Object getAttribute(HttpServletRequest request, String key) {
		HttpSession session = request.getSession(false); // providing false in param means don't create new session fetch existing one
		if(session != null) {
			return session.getAttribute(key);
		}
		return null;
	}
	
	public static void invalidate(HttpServletRequest request) {
		HttpSession session=request.getSession(false); //don't create fetch existing one
		if(session != null) {
			session.invalidate();
		}
	}
}
