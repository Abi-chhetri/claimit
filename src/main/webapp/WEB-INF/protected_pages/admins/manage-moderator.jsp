<%@page import="com.claimit.enums.ActivityStatus"%>
<%@page import="com.claimit.utils.SessionManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.claimit.model.Admin, java.util.List, java.text.SimpleDateFormat" %>
<% 
String msg =(String) SessionManager.getAttribute(request, "msg"); 
List<Admin> admins= (List<Admin>) request.getAttribute("admins");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard-nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manage-moderators.css">
    <%if(msg!=null){ %>
		<meta http-equiv="refresh" content="3">
		<%SessionManager.deleteSession(request, "msg");%>
	<%} %>
</head> 

<body>
	<!-- over lay model for admin form -->
	<div id="addModModal" class="modal-overlay ${showModal == true ? 'active' : ''}">
	    <div class="modal-box">
	        <div class="modal-header">
	            <h3>Add Moderator</h3>
	            <a href="${pageContext.request.contextPath}/ManageModerator" class="modal-close">
	                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
	                    <path fill="none" stroke="#64748B" stroke-linecap="round" stroke-width="2" d="M18 6L6 18M6 6l12 12"/>
	                </svg>
	            </a>
	        </div>
	        <div class="modal-body">
	            <% if (Boolean.TRUE.equals(request.getAttribute("showModal"))) { %>
	                <jsp:include page="/WEB-INF/protected_pages/views_forInclude/admin-form.jsp" />
	            <% } %>
	        </div>
	    </div>
	</div>
	<!-- overlay model ends here -->
    <aside>
        <section class="admin-aside-outer">
            <div class="admin-aside-claimit-console">
                <p class="claimit-admin-console">ClaimIt Admin Console</p>
                <p class="management-dashboard">Management Dashboard</p>
            </div>

            <div class="admin-aside-admin-function-outer">
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/AdminDashBoard" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569"
                                d="M13 9V3h8v6zM3 13V3h8v10zm10 8V11h8v10zM3 21v-6h8v6zm2-10h4V5H5zm10 8h4v-6h-4zm0-12h4V5h-4zM5 19h4v-2H5zm4-2" />
                        </svg>
                        <p class="admin-function-name">Dashboard</p>
                    </a>
                </div>
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/ManageItem" class="admin-functions">
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
                    <a href="${pageContext.request.contextPath}/ManageClaim" class="admin-functions">
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
                    <a href="${pageContext.request.contextPath}/ManageReport" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" viewBox="0 0 16 16">
                            <rect width="16" height="16" fill="none" />
                            <path fill="#475569"
                                d="M0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0 1 14.25 13H8.06l-2.573 2.573A1.458 1.458 0 0 1 3 14.543V13H1.75A1.75 1.75 0 0 1 0 11.25Zm1.75-.25a.25.25 0 0 0-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 0 1 .75.75v2.19l2.72-2.72a.75.75 0 0 1 .53-.22h6.5a.25.25 0 0 0 .25-.25v-9.5a.25.25 0 0 0-.25-.25Zm7 2.25v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0M9 9a1 1 0 1 1-2 0a1 1 0 0 1 2 0" />
                        </svg>
                        <p class="admin-function-name">Manage Reports</p>
                    </a>
                </div>
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/ManageUser" class="admin-functions">
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
                        <p class="admin-function-name">Manage Users</p>
                    </a>
                </div>
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/ManageModerator" class="admin-functions active-nav"
                        style="color:#1D4ED8;background:#1d4fd813;border-right:4px solid #1D4ED8;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 8 8">
                            <rect width="8" height="8" fill="none" />
                            <path fill="#1D4ED8" d="M4 4v3q2 0 3-3M4 4V1L1 2v2m3-4l4 2c0 8-8 8-8 0" />
                        </svg>
                        <p class="admin-function-name">Manage Moderators</p>
                    </a>
                </div>
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/ManageContactMessage" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M2.004 9.303A4.5 4.5 0 0 1 6.5 5h19a4.5 4.5 0 0 1 4.496 4.303l-1.476.82L16 16.864L3.48 10.123zM2 11.588V22.5A4.5 4.5 0 0 0 6.5 27h19a4.5 4.5 0 0 0 4.5-4.5V11.588l-.526.293l-13 7a1 1 0 0 1-.948 0L2.514 11.874z" />
                        </svg>
                        <p class="admin-function-name">Contact Messages</p>
                    </a>
                </div>
                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/AdminLog" class="admin-functions">
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
                    <a href="${pageContext.request.contextPath}/Logout" class="admin-logo">
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
                                d="M14.68 14.81a6.76 6.76 0 1 1 6.76-6.75a6.77 6.77 0 0 1-6.76 6.75m0-11.51a4.76 4.76 0 1 0 4.76 4.76a4.76 4.76 0 0 0-4.76-4.76" />
                            <path fill="#475569"
                                d="M16.42 31.68A2.14 2.14 0 0 1 15.8 30H4v-5.78a14.8 14.8 0 0 1 11.09-4.68h.72a2.2 2.2 0 0 1 .62-1.85l.12-.11c-.47 0-1-.06-1.46-.06A16.47 16.47 0 0 0 2.2 23.26a1 1 0 0 0-.2.6V30a2 2 0 0 0 2 2h12.7Z" />
                            <path fill="#475569" d="M26.87 16.29a.4.4 0 0 1 .15 0a.4.4 0 0 0-.15 0" />
                            <path fill="#475569"
                                d="m33.68 23.32l-2-.61a7.2 7.2 0 0 0-.58-1.41l1-1.86A.38.38 0 0 0 32 19l-1.45-1.45a.36.36 0 0 0-.44-.07l-1.84 1a7 7 0 0 0-1.43-.61l-.61-2a.36.36 0 0 0-.36-.24h-2.05a.36.36 0 0 0-.35.26l-.61 2a7 7 0 0 0-1.44.6l-1.82-1a.35.35 0 0 0-.43.07L17.69 19a.38.38 0 0 0-.06.44l1 1.82a6.8 6.8 0 0 0-.63 1.43l-2 .6a.36.36 0 0 0-.26.35v2.05A.35.35 0 0 0 16 26l2 .61a7 7 0 0 0 .6 1.41l-1 1.91a.36.36 0 0 0 .06.43l1.45 1.45a.38.38 0 0 0 .44.07l1.87-1a7 7 0 0 0 1.4.57l.6 2a.38.38 0 0 0 .35.26h2.05a.37.37 0 0 0 .35-.26l.61-2.05a7 7 0 0 0 1.38-.57l1.89 1a.36.36 0 0 0 .43-.07L32 30.4a.35.35 0 0 0 0-.4l-1-1.88a7 7 0 0 0 .58-1.39l2-.61a.36.36 0 0 0 .26-.35v-2.1a.36.36 0 0 0-.16-.35M24.85 28a3.34 3.34 0 1 1 3.33-3.33A3.34 3.34 0 0 1 24.85 28" />
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
                <section class="admin-dashboar-nav">

                    <span class="admin-dashboar-overview">
                        <p class="overview">Overview</p>
                    </span>
                    <span class="no-admin-dashboar-overview">
                        <span class="admin-dashboard-nav-txt">
                            <p class="admin-dashboard-name">${admin.fullName}</p>
                            <p class="admin-dashboard-type">${admin.role}</p>
                        </span>

                        <a href="${pageContext.request.contextPath}" class="admin-dashboard-admin-logo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 16 16">
                                <rect width="16" height="16" fill="none" />
                                <path fill="#000" d="M11 7c0 1.66-1.34 3-3 3S5 8.66 5 7s1.34-3 3-3s3 1.34 3 3" />
                                <path fill="#000" fill-rule="evenodd"
                                    d="M16 8c0 4.42-3.58 8-8 8s-8-3.58-8-8s3.58-8 8-8s8 3.58 8 8M4 13.75C4.16 13.484 5.71 11 7.99 11c2.27 0 3.83 2.49 3.99 2.75A6.98 6.98 0 0 0 14.99 8c0-3.87-3.13-7-7-7s-7 3.13-7 7c0 2.38 1.19 4.49 3.01 5.75"
                                    clip-rule="evenodd" />
                            </svg>
                        </a>
                    </span>
                </section>
				   <%if(msg != null && msg.contains("Failed to create moderator")) {%>
				    	<span class="error-msg"><%= msg %></span>
				   	<%}else if(msg != null && msg.contains("Successfully created new moderator")){ %>
				    	<span class="suc-msg"><%= msg %></span>
				    <%} %>
                <div class="mm-hero">
                    <span class="mm-upper">
                        <div class="mm-breadcrumb">
                            <span class="mm-breadcrumb-sep"></span>
                            <span class="active">MODERATORS</span>
                        </div>

                        <div class="mm-hero-left">
                            <h1>Manage Moderators</h1>
                            <p>Grant and revoke permissions, oversee activity, and manage the elite response team for
                                ClaimIt digital concierge.</p>
                        </div>
                    </span>

                    <div class="mm-total-card">
                        <p class="mm-total-label">TOTAL MODERATORS</p>
                        <p class="mm-total-value"><%=admins.size() %></p>
                        <form action="${pageContext.request.contextPath}/ManageModerator" method="POST" class="mm-add-btn">
                        	<input type="hidden" name="action" value="addMod">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <rect width="24" height="24" fill="none" />
                                <g fill="none" stroke="#005BBF" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2">
                                    <g stroke-dasharray="22">
                                        <path d="M3 21v-1c0 -2.21 1.79 -4 4 -4h4c2.21 0 4 1.79 4 4v1">
                                            <animate fill="freeze" attributeName="stroke-dashoffset" dur="0.3s"
                                                values="22;0" />
                                        </path>
                                        <path stroke-dashoffset="22"
                                            d="M9 13c-1.66 0 -3 -1.34 -3 -3c0 -1.66 1.34 -3 3 -3c1.66 0 3 1.34 3 3c0 1.66 -1.34 3 -3 3Z">
                                            <animate fill="freeze" attributeName="stroke-dashoffset" begin="0.3s"
                                                dur="0.3s" to="0" />
                                        </path>
                                    </g>
                                    <g stroke-dasharray="8" stroke-dashoffset="8">
                                        <path d="M15 6h6">
                                            <animate fill="freeze" attributeName="stroke-dashoffset" begin="0.7s"
                                                dur="0.2s" to="0" />
                                        </path>
                                        <path d="M18 3v6">
                                            <animate fill="freeze" attributeName="stroke-dashoffset" begin="0.9s"
                                                dur="0.2s" to="0" />
                                        </path>
                                    </g>
                                </g>
                            </svg>
							<button type="submit" style="display:flex;align-items:center;gap:8px;padding:10px 18px;background:#1D4ED8;color:#fff;border:none;border-radius:8px;font-size:14px;font-weight:600;cursor:pointer;letter-spacing:1px;">
							    Add Moderator
							</button>
                        </form>
                    </div>
                </div>

                <!-- Table -->
                <div class="mm-table-section">
                    <div class="mm-table-header">
                        <div>
                            <h2>Active Moderators</h2>
                            <p>Current users with system-level access.</p>
                        </div>
						<div class="mm-table-actions">
						    <form action="${pageContext.request.contextPath}/ManageModerator" method="GET" class="mm-icon-action" title="Filter">
						        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
						            <rect width="24" height="24" fill="none" />
						            <path fill="#94A3B8" fill-rule="evenodd"
						                d="M3.25 7A.75.75 0 0 1 4 6.25h16a.75.75 0 0 1 0 1.5H4A.75.75 0 0 1 3.25 7m0 5a.75.75 0 0 1 .75-.75h11a.75.75 0 0 1 0 1.5H4a.75.75 0 0 1-.75-.75m0 5a.75.75 0 0 1 .75-.75h5a.75.75 0 0 1 0 1.5H4a.75.75 0 0 1-.75-.75"
						                clip-rule="evenodd" />
						        </svg>
						        <span id="filter-label" style="font-size:13px;color:#475569;font-weight:500;">
						            ${not empty selectedStatus ? selectedStatus : 'All'}
						        </span>
						        <select name="status" class="mm-status-filter" onchange="this.form.submit()">
						            <option value="" ${empty selectedStatus ? 'selected' : ''}>All</option>
						            <option value="ACTIVE"   ${selectedStatus == 'ACTIVE'    ? 'selected' : ''}>Active</option>
						            <option value="INACTIVE" ${selectedStatus == 'INACTIVE'  ? 'selected' : ''}>Inactive</option>
						            <option value="SUSPENDED"${selectedStatus == 'SUSPENDED' ? 'selected' : ''}>Suspended</option>
						        </select>
						    </form>
						</div>
                    </div>
                    <div class="mm-table-wrap">
                        <table class="mm-table">
                            <thead>
                                <tr>
                                    <th>MODERATOR ID</th>
                                    <th>FULL NAME</th>
                                    <th>EMAIL</th>
                                    <th>DATE ADDED</th>
                                    <th>AVAILABLE ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
							<%for(Admin eachAdmin: admins){ %>
							    <tr>
							        <td><span class="mm-mod-id">#<%= eachAdmin.getAdminId()%></span></td>
							        <td>
							            <div class="mm-mod-info">
							                <div class="mm-avatar" style="background:#DBEAFE;color:#1E40AF;"><%=eachAdmin.getFullName().split(" ").length >= 2 ? "" + eachAdmin.getFullName().split(" ")[0].charAt(0) + eachAdmin.getFullName().split(" ")[1].charAt(0) : "" + eachAdmin.getFullName().charAt(0)%></div>
							                <span class="mm-mod-name"><%=eachAdmin.getFullName() %></span>
							            </div>
							        </td>
							        <td><span class="mm-mod-email"><%=eachAdmin.getEmail()%></span></td>
							        <td><span class="mm-date"><%= new SimpleDateFormat("MMM dd, YYYY").format(eachAdmin.getCreatedAt()) %></span></td>
									<td>
									    <div class="mm-actions-cell">
									        <%if(eachAdmin.getStatus().equals(ActivityStatus.ACTIVE.name()) || eachAdmin.getStatus().equals(ActivityStatus.INACTIVE.name())){ %>
									        <form action="${pageContext.request.contextPath}/ManageModerator" method="POST">
									            <input type="hidden" name="adminId" value="<%= eachAdmin.getAdminId() %>">
									            <input type="hidden" name="actionDb" value="SUSPENDED">
									            <button type="submit" class="mm-suspend-btn">
									                <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24">
									                    <path fill="#854D0E" d="M12 2a10 10 0 1 0 0 20A10 10 0 0 0 12 2m0 18a8 8 0 1 1 0-16a8 8 0 0 1 0 16m-1-5h2v2h-2zm0-8h2v6h-2z"/>
									                </svg>
									                Suspend
									            </button>
									        </form>
									        <%}else{ %>
									        <form action="${pageContext.request.contextPath}/ManageModerator" method="POST">
									            <input type="hidden" name="adminId" value="<%= eachAdmin.getAdminId() %>">
									            <input type="hidden" name="actionDb" value="ACTIVE">
									            <button type="submit" class="mm-reinstate-btn">
									                <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24">
									                    <path fill="#166534" d="m9 16.17l-4.17-4.17l-1.42 1.41L9 19L21 7l-1.41-1.41z"/>
									                </svg>
									                Reinstate
									            </button>
									        </form>
									        <%} %>
									    </div>
									</td>
							    </tr>
							<%} %>
							<%if(admins.isEmpty()){ %>
							    <tr>
							        <td colspan="5" style="text-align:center;padding:48px 24px;">
							            <div style="display:flex;flex-direction:column;align-items:center;gap:10px;">
							                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24">
							                    <rect width="24" height="24" fill="none"/>
							                    <path fill="#CBD5E1" d="M12 2a10 10 0 1 0 0 20A10 10 0 0 0 12 2m0 18a8 8 0 1 1 0-16a8 8 0 0 1 0 16m-1-5h2v2h-2zm0-8h2v6h-2z"/>
							                </svg>
							                <p style="font-size:14px;font-weight:600;color:#475569;margin:0;">No moderators found</p>
							                <p style="font-size:12px;color:#94A3B8;margin:0;">No results match the selected filter.</p>
							            </div>
							        </td>
							    </tr>
							<%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>

        <footer class="admin-dash-nav">
            <div class="footer-left">

                <p class="footer-brand">ClaimIt Admin Console</p>
                <p class="footer-copy">©️ 2024 ClaimIt Digital Concierge. All rights reserved.</p>
            </div>
            <div class="footer-links">
                <a href="privacy-policy.html">Privacy Policy</a>
                <a href="term-of-service.html">Terms of Service</a>
                <a href="security-audit.html">Security Audit</a>
                <a href="Support.html">Support</a>
            </div>
        </footer>
    </article>

</body>

</html>