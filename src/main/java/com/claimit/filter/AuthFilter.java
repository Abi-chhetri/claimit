package com.claimit.filter;

import java.io.IOException;

import com.claimit.enums.AdminRoles;
import com.claimit.model.Admin;
import com.claimit.model.User;
import com.claimit.services.AdminService;
import com.claimit.services.UserService;
import com.claimit.utils.CookieManager;
import com.claimit.utils.SessionManager;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//Servlet Filter implementation class AuthFilter
				// Intercepts every request in this web application for
@WebFilter("/*")		// authentication/authorization checks
public class AuthFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;
    private static final String Login = "/Login";
    private static final String Register = "/Register";
    private static final String Home = "/Home";
    private static final String About = "/About";
    private static final AdminService ADMIN_SERVICE = new AdminService();
    private static final UserService USER_SERVICE= new UserService();

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

        // Static resources - always allow
        boolean isStaticResource = path.startsWith("/images/") || path.endsWith(".css") 
                || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg") 
                || path.endsWith(".jpeg");

        // Public pages - no login needed
        boolean isPublic = path.equals(Login) || path.equals(Register) || path.equals(Home)
                || path.equals(About) || path.equals("/HealthCheck");

        if (isStaticResource || isPublic) {
            chain.doFilter(request, response);
            return;
        }

        // Check session
        Integer userId = (Integer) SessionManager.getAttribute(req, "userId");
        Integer adminID = (Integer) SessionManager.getAttribute(req, "adminId");
        boolean isLoggedIn = (userId != null || adminID != null);

        // Cookie fallback if session expired
        if (!isLoggedIn) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("userId")) {
                        try {
                            int cookieUserId = Integer.parseInt(cookie.getValue());
                             //DB validation
                             User user = USER_SERVICE.getUserByID(String.valueOf(cookieUserId));
                             if (user != null) {
                                SessionManager.setAttribute(req, "userId", cookieUserId);
                                isLoggedIn = true;
                             } else {
                                 CookieManager.deleteCookie(res, "userId");
                             }
                        } catch (NumberFormatException e) {
                            CookieManager.deleteCookie(res, "userId");
                        }
                    } else if (cookie.getName().equals("adminId")) {
                        try {
                            int cookieAdminId = Integer.parseInt(cookie.getValue());
                            // DB validation + role restoration
                            Admin admin = ADMIN_SERVICE.getAdminByID(String.valueOf(cookieAdminId));
                            if (admin != null) {
                                SessionManager.setAttribute(req, "adminId", cookieAdminId);
                                SessionManager.setAttribute(req, "adminRole", admin.getRole());
                                isLoggedIn = true;
                            } else {
                                CookieManager.deleteCookie(res, "adminId");
                            }
                        } catch (NumberFormatException e) {
                            CookieManager.deleteCookie(res, "adminId");
                        }
                    }
                }
            }
        }

        // Not logged in - redirect to login
        if (!isLoggedIn) {
            res.sendRedirect(req.getContextPath() + Login);
            return;
        }

        // Re-fetch after cookie fallback may have set session
        userId = (Integer) SessionManager.getAttribute(req, "userId");
        Integer adminId = (Integer) SessionManager.getAttribute(req, "adminId");

        // Admin + Moderator pages
        boolean isAdminPage_Moder = path.equals("/AdminDashBoard") || path.equals("/ManageUser")
                || path.equals("/AdminLog") || path.equals("/ManageClaim")
                || path.equals("/ManageContactMessage") || path.equals("/ManageItem")
                || path.equals("/ManageReport") || path.equals("/ViewClaim");

        // Admin only pages
        boolean isAdminOnly = path.equals("/ManageModerator") || path.equals("/AdminForm");

        // User only pages
        boolean isUserPage = path.equals("/DashBoard") || path.equals("/MyClaim")
                || path.equals("/MyRequestedClaim") || path.equals("/Claims")
                || path.equals("/ViewDetails") || path.equals("/ReportFoundItem")
                || path.equals("/Browse") || path.equals("/UserProfile")
                || path.equals("/Notification");

        // Block admin/moderator from user pages
        if (adminId != null && isUserPage) {
            res.sendRedirect(req.getContextPath() + "/AdminDashBoard");
            return;
        }

        // Block user from admin/moderator pages
        if (userId != null && adminId == null && (isAdminPage_Moder || isAdminOnly)) {
            res.sendRedirect(req.getContextPath() + "/DashBoard");
            return;
        }

        // Admin + Moderator page access check
        if (isAdminPage_Moder) {
            if (adminId == null) {
                res.sendRedirect(req.getContextPath() + "/DashBoard");
                return;
            }
        }

        // Admin only page access check
        if (isAdminOnly) {
            if (adminId == null) {
                res.sendRedirect(req.getContextPath() + "/DashBoard");
                return;
            }
            Admin admin = ADMIN_SERVICE.getAdminByID(String.valueOf(adminId));
            if (admin == null || !admin.getRole().equals(AdminRoles.ADMIN.name())) {
                res.sendRedirect(req.getContextPath() + "/AdminDashBoard");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
