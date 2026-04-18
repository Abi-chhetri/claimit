<%@page import="com.claimit.enums.Status"%>
<%@page import="com.claimit.enums.RegistrationStatus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.claimit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>
    
<%List<User> users=(List<User>) request.getAttribute("users");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard-nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manage-user.css">
</head>

<body>
    <aside>
        <section class="admin-aside-outer">
            <div class="admin-aside-claimit-console">
                <p class="claimit-admin-console">ClaimIt Admin Console</p>
                <p class="management-dashboard">Management Dashboard</p>
            </div>

            <div class="admin-aside-admin-function-outer">

                <div class="admin-aside-admin-function">
                    <a href="admin-dashboard.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569"
                                d="M13 9V3h8v6zM3 13V3h8v10zm10 8V11h8v10zM3 21v-6h8v6zm2-10h4V5H5zm10 8h4v-6h-4zm0-12h4V5h-4zM5 19h4v-2H5zm4-2" />
                        </svg>
                        <p class="admin-function-name">Dashboard</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-item.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M20 21h-8a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2m-8-4v2h8v-2Z" />
                            <path fill="#475569"
                                d="M28 4H4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2v16a2 2 0 0 0 2 2h20a2 2 0 0 0 2-2V12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2m-2 24H6V12h20Zm2-18H4V6h24z" />
                        </svg>
                        <p class="admin-function-name">Manage Items</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-claim.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569" fill-rule="evenodd"
                                d="M20 4H4a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1M4 2a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h16a3 3 0 0 0 3-3V5a3 3 0 0 0-3-3zm2 5h2v2H6zm5 0a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2zm-3 4H6v2h2zm2 1a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2h-6a1 1 0 0 1-1-1m-2 3H6v2h2zm2 1a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2h-6a1 1 0 0 1-1-1"
                                clip-rule="evenodd" />
                        </svg>
                        <p class="admin-function-name">Manage Claims</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-report.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" viewBox="0 0 16 16">
                            <rect width="16" height="16" fill="none" />
                            <path fill="#475569"
                                d="M0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0 1 14.25 13H8.06l-2.573 2.573A1.458 1.458 0 0 1 3 14.543V13H1.75A1.75 1.75 0 0 1 0 11.25Zm1.75-.25a.25.25 0 0 0-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 0 1 .75.75v2.19l2.72-2.72a.75.75 0 0 1 .53-.22h6.5a.25.25 0 0 0 .25-.25v-9.5a.25.25 0 0 0-.25-.25Zm7 2.25v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0M9 9a1 1 0 1 1-2 0a1 1 0 0 1 2 0" />
                        </svg>
                        <p class="admin-function-name">Manage Reports</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-user.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="21" viewBox="0 0 21 21">
                            <rect width="21" height="21" fill="none" />
                            <g fill="none" fill-rule="evenodd" stroke="#000" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="1">
                                <path
                                    d="M8.5 2.5a3 3 0 0 1 3 3v2a3 3 0 1 1-6 0v-2a3 3 0 0 1 3-3m7 14v-.728c0-3.187-3.686-5.272-7-5.272s-7 2.085-7 5.272v.728a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1" />
                                <path fill="#475569"
                                    d="M12.52 2.678A3 3 0 0 1 14.5 5.5v1c0 1.297-.848 2.581-2 3q1.01-1.379 1.01-3.5c0-2.122-.331-2.523-.99-3.322M17.5 17.5h1a1 1 0 0 0 1-1v-.728c0-2.17-1.71-3.83-3.847-4.667c0 0 2.847 2.395 1.847 6.395" />
                            </g>
                        </svg>
                        <p class="admin-function-name">Mange Users</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-moderators.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 8 8">
                            <rect width="8" height="8" fill="none" />
                            <path fill="#475569" d="M4 4v3q2 0 3-3M4 4V1L1 2v2m3-4l4 2c0 8-8 8-8 0" />
                        </svg>
                        <p class="admin-function-name">Manage Moderators</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="contact-message.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M2.004 9.303A4.5 4.5 0 0 1 6.5 5h19a4.5 4.5 0 0 1 4.496 4.303l-1.476.82L16 16.864L3.48 10.123zM2 11.588V22.5A4.5 4.5 0 0 0 6.5 27h19a4.5 4.5 0 0 0 4.5-4.5V11.588l-.526.293l-13 7a1 1 0 0 1-.948 0L2.514 11.874z" />
                        </svg>
                        <p class="admin-function-name">Contact Messages</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="admin-logs.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569"
                                d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12h2a8 8 0 1 0 1.385-4.5H8v2H2v-6h2V6a9.99 9.99 0 0 1 8-4m1 5v4.585l3.243 3.243l-1.415 1.415L11 12.413V7z" />
                        </svg>
                        <p class="admin-function-name">Admin Logs</p>
                    </a>
                </div>

            </div>

            <div class="admin-aside-admin-logout">
                <div id="admin-logo">
                    <a href="#" class="admin-logo">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <g fill="#475569">
                                <path
                                    d="M6.5 3.75c-.526 0-1.25.63-1.25 1.821V18.43c0 1.192.724 1.821 1.25 1.821h6.996a.75.75 0 1 1 0 1.5H6.5c-1.683 0-2.75-1.673-2.75-3.321V5.57c0-1.648 1.067-3.321 2.75-3.321h7a.75.75 0 0 1 0 1.5z" />
                                <path
                                    d="M16.53 7.97a.75.75 0 0 0-1.06 0v3.276H9.5a.75.75 0 0 0 0 1.5h5.97v3.284a.75.75 0 0 0 1.06 0l3.5-3.5a.75.75 0 0 0 .22-.532v-.002a.75.75 0 0 0-.269-.575z" />
                            </g>
                        </svg>
                        <p class="admin-dash-logout-txt">Logout</p>
                    </a>
                </div>

                <div id="admin-logo">
                    <a href="#" class="admin-user-system-outer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 36 36">
                            <rect width="36" height="36" fill="none" />
                            <path fill="#475569"
                                d="M14.68 14.81a6.76 6.76 0 1 1 6.76-6.75a6.77 6.77 0 0 1-6.76 6.75m0-11.51a4.76 4.76 0 1 0 4.76 4.76a4.76 4.76 0 0 0-4.76-4.76"
                                class="clr-i-outline clr-i-outline-path-1" />
                            <path fill="#475569"
                                d="M16.42 31.68A2.14 2.14 0 0 1 15.8 30H4v-5.78a14.8 14.8 0 0 1 11.09-4.68h.72a2.2 2.2 0 0 1 .62-1.85l.12-.11c-.47 0-1-.06-1.46-.06A16.47 16.47 0 0 0 2.2 23.26a1 1 0 0 0-.2.6V30a2 2 0 0 0 2 2h12.7Z"
                                class="clr-i-outline clr-i-outline-path-2" />
                            <path fill="#475569" d="M26.87 16.29a.4.4 0 0 1 .15 0a.4.4 0 0 0-.15 0"
                                class="clr-i-outline clr-i-outline-path-3" />
                            <path fill="#475569"
                                d="m33.68 23.32l-2-.61a7.2 7.2 0 0 0-.58-1.41l1-1.86A.38.38 0 0 0 32 19l-1.45-1.45a.36.36 0 0 0-.44-.07l-1.84 1a7 7 0 0 0-1.43-.61l-.61-2a.36.36 0 0 0-.36-.24h-2.05a.36.36 0 0 0-.35.26l-.61 2a7 7 0 0 0-1.44.6l-1.82-1a.35.35 0 0 0-.43.07L17.69 19a.38.38 0 0 0-.06.44l1 1.82a6.8 6.8 0 0 0-.63 1.43l-2 .6a.36.36 0 0 0-.26.35v2.05A.35.35 0 0 0 16 26l2 .61a7 7 0 0 0 .6 1.41l-1 1.91a.36.36 0 0 0 .06.43l1.45 1.45a.38.38 0 0 0 .44.07l1.87-1a7 7 0 0 0 1.4.57l.6 2a.38.38 0 0 0 .35.26h2.05a.37.37 0 0 0 .35-.26l.61-2.05a7 7 0 0 0 1.38-.57l1.89 1a.36.36 0 0 0 .43-.07L32 30.4a.35.35 0 0 0 0-.4l-1-1.88a7 7 0 0 0 .58-1.39l2-.61a.36.36 0 0 0 .26-.35v-2.1a.36.36 0 0 0-.16-.35M24.85 28a3.34 3.34 0 1 1 3.33-3.33A3.34 3.34 0 0 1 24.85 28"
                                class="clr-i-outline clr-i-outline-path-4" />
                            <path fill="none" d="M0 0h36v36H0z" />
                        </svg>
                        <span class="admin-user-system">
                            <p class="admin-user">Admin User</p>
                            <p class="system-oversight">System Oversight</p>
                        </span>
                    </a>
                </div>
            </div>

        </section>
    </aside>

    <article class="main-footer">
        <main>
            <section class="admin-main-outer">

                <!-- Page Header -->
                <div class="mu-header">
                    <div>
                        <h1 class="mu-title">Manage Users</h1>
                        <p class="mu-subtitle">Overview and control of the Claimit user base.</p>
                    </div>
                    <div class="mu-header-actions">
                        <div class="mu-search">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24"
                                fill="none" stroke="#94A3B8" stroke-width="2">
                                <circle cx="11" cy="11" r="8" />
                                <line x1="21" y1="21" x2="16.65" y2="16.65" />
                            </svg>
                            <input type="text" placeholder="Search by name or email..." />
                        </div>

                        <!-- Filter checkbox hack -->
                        <input type="checkbox" id="mu-filter-toggle" class="mu-filter-checkbox" />
                        <label for="mu-filter-toggle" class="mu-filter-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <rect width="24" height="24" fill="none" />
                                <path fill="none" stroke="#191C23" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="1.5" d="M4.5 7.25h15M7.385 12h9.23m-6.345 4.75h3.46" />
                            </svg>
                            Filters
                        </label>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="mu-stats">
                    <div class="mu-stat-card">
                        <p class="mu-stat-label">TOTAL USERS</p>
                        <p class="mu-stat-value">12,842</p>
                        <p class="mu-stat-note green">↗ +8% this month</p>
                    </div>
                    <div class="mu-stat-card">
                        <p class="mu-stat-label">ACTIVE NOW</p>
                        <p class="mu-stat-value">492</p>
                        <p class="mu-stat-note gray">Real-time engagement</p>
                    </div>
                    <div class="mu-stat-card">
                        <p class="mu-stat-label">NEW TODAY</p>
                        <p class="mu-stat-value">158</p>
                        <p class="mu-stat-note green">Verified registrations</p>
                    </div>
                    <div class="mu-stat-card">
                        <p class="mu-stat-label">REQUEST</p>
                        <p class="mu-stat-value red">24</p>
                        <p class="mu-stat-note gray">Pending review</p>
                    </div>
                </div>

                <!-- Filter Panel -->
                <div class="mu-filter-panel">
                    <div class="mu-filter-group">
                        <label>Status</label>
                        <select>
                            <option>All</option>
                            <option>Active</option>
                            <option>Blocked</option>
                        </select>
                    </div>
                    <div class="mu-filter-group">
                        <label>Registration</label>
                        <select>
                            <option>All Time</option>
                            <option>Last 7 Days</option>
                            <option>Last 30 Days</option>
                            <option>Last 90 Days</option>
                        </select>
                    </div>
                    <div class="mu-filter-group">
                        <label>Verified</label>
                        <select>
                            <option>All</option>
                            <option>Verified</option>
                            <option>Unverified</option>
                        </select>
                    </div>
                </div>

                <!-- Users Table -->
                <div class="mu-table-wrap">
                    <table class="mu-table">
                        <thead>
                            <tr>
                                <th>USER ID</th>
                                <th>FULL NAME</th>
                                <th>CONTACT INFORMATION</th>
                                <th>REGISTRATION</th>
                                <th>STATUS</th>
                                <th>ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(User user:users) { %>
                             <tr>
                                <td class="mu-uid">#<%=user.getUserId() %></td>
                                <td>
                                    <div class="mu-user-info">
                                        <div class="mu-avatar" style="background:#fce7f3;color:#9d174d;">
                                        	<%= user.getFullName().trim().substring(0,1).toUpperCase() + user.getFullName().trim().split(" ")[1].substring(0,1).toUpperCase() %>
                                        </div>
                                        <div>
                                            <p class="mu-name"><%= user.getFullName() %></p>
                                            <p class="mu-verified">
                                            	<%= user.getApprovedAt() != null ? "✔ Verified" : " ❌ Un-Verified" %>
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mu-email"><%=user.getEmail() %></p>
                                    <p class="mu-phone"><%=user.getPhoneNumber() %></p>
                                </td>
                                <td>
                                    <p class="mu-date">
                                    	<%= user.getApprovedAt() != null ? user.getApprovedAt().toString().substring(0, 10) : "N/A" %>
                                    </p>
                                    <%
									    Timestamp ts = user.getApprovedAt();
									    String formattedTime = ts != null ? new java.text.SimpleDateFormat("hh:mm a").format(ts) : "";
									%>
                                    <p class="mu-time"> 
                                    	<%= formattedTime %>
                                    </p>
                                </td>
                                <td>
                                <%if(user.getStatus().equals(Status.SUSPENDED.name())) {%>
                                	<span class="mu-badge blocked"><%=user.getStatus() %></span>
                                <%}else if(user.getStatus().equals( Status.ACTIVE.name())) {%>
                                	<span class="mu-badge active"><%=user.getStatus() %></span>
                                <%}else if(user.getStatus().equals(Status.INACTIVE.name())){ %>
                                	<span class="mu-badge blocked"><%=user.getStatus() %></span>
                                <%}%>
                                </td>
                                <td>
                                    <div class="mu-actions">
                                        <button class="mu-btn">View</button>
                                        <button class="mu-btn">Edit</button>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                            
                        </tbody>
                    </table>
                </div>

            </section>
        </main>

        <footer class="admin-dash-nav">
            <div class="footer-left">
                <p class="footer-brand">ClaimIt Admin Console</p>
                <p class="footer-copy">© 2024 ClaimIt Digital Concierge. All rights reserved.</p>
            </div>
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Security Audit</a>
                <a href="#">Support</a>
            </div>
        </footer>
    </article>

</body>

</html>