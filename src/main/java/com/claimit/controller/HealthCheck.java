package com.claimit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.claimit.utils.DataBase_Config;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HealthCheck")
public class HealthCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HealthCheck() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		boolean dbUp = false;

		try (Connection con = DataBase_Config.getConection()) {
			dbUp = true;
			System.out.println("Connected");
		} catch (Exception se) {
			dbUp = false;
			System.out.println("fail");
			se.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>claimit : Health Check</title>");
		out.println("<style>");
		out.println(
				"  html, body { height:100%; margin:0; display:flex; flex-direction:column; justify-content:center; align-items:center; background:#111; color:#0f0; font-family:Arial, sans-serif; }");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		if (dbUp) {
			out.println("<h1>Server Status : Healthy </h1>");
			out.println("<h1>Database Status : Healthy </h1>");
		} else {
			out.println("<h1>Server Status : Healthy </h1>");
			out.println("<h1 style='color:red;'>Database Status : Not Connected (Unreachable)</h1>");
		}
		out.println("</body>");
		out.println("</html>");
	}

}
