package com.claimit.filter;

import java.io.IOException;

import com.claimit.model.Admin;
import com.claimit.model.User;
import com.claimit.utils.SessionManager;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//Servlet Filter implementation class AuthFilter
@WebFilter("/*") // Intercepts every request in this web application for authentication/authorization checks
public class AuthFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	public static final String Login = "/Login";
	public static final String Register = "/Register";
	public static final String Home = "/Home";
	public static final String About = "/About";

	public AuthFilter() {
		super();
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		String path = uri.substring(req.getContextPath().length());

		boolean isStaticResource = path.startsWith("/images/") || path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png")
				|| path.endsWith(".jpg") || path.endsWith(".jpeg");

		boolean isPublic = path.equals(Login) || path.equals(Register) || path.equals(Home) || path.equals(About) || path.equals("/HealthCheck");

		// allow public + static
		if (isStaticResource || isPublic) {
			chain.doFilter(request, response);
			return;
		}

		Integer userId=(Integer) SessionManager.getAttribute(req, "userId");
		Integer adminID = (Integer) SessionManager.getAttribute(req, "adminId");

		boolean isLoggedIn = (userId != null || adminID != null);

		if (!isLoggedIn && !isPublic) {
			res.sendRedirect(req.getContextPath() + Login);
			return;
		}
		chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
