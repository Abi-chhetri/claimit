<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%Integer totalUsers=(Integer) request.getAttribute("userCount"); %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Admin Dashboard </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard-nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
    <% String flash = (String) session.getAttribute("flashMessage"); if (flash !=null) { %>
    <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/AdminDashBoard">
    <% } %>
</head>

<body>
		<%
		if (flash != null) {
		%>
		<div class="msg-box">
			<%=flash%>
			<%session.removeAttribute("flashMessage"); %>
		</div>
		<%
		}
		%>
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
                    <a href="${pageContext.request.contextPath}/ManageReports" class="admin-functions">
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
                    <a href="${pageContext.request.contextPath}/ManageModerators" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 8 8">
                            <rect width="8" height="8" fill="none" />
                            <path fill="#475569" d="M4 4v3q2 0 3-3M4 4V1L1 2v2m3-4l4 2c0 8-8 8-8 0" />
                        </svg>

                        <p class="admin-function-name">Manage Moderators</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/ContactMessage" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M2.004 9.303A4.5 4.5 0 0 1 6.5 5h19a4.5 4.5 0 0 1 4.496 4.303l-1.476.82L16 16.864L3.48 10.123zM2 11.588V22.5A4.5 4.5 0 0 0 6.5 27h19a4.5 4.5 0 0 0 4.5-4.5V11.588l-.526.293l-13 7a1 1 0 0 1-.948 0L2.514 11.874z" />
                        </svg>

                        <p class="admin-function-name">Contact Messages</p>
                    </a>
                </div>


                <div class="admin-aside-admin-function">
                    <a href="${pageContext.request.contextPath}/AdminLogs" class="admin-functions">
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

                <div id="admin-logo" class="">
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

                        <p class="">Logout</p>
                    </a>
                </div>

                <div id="admin-logo" class="">
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
            <section class="admin-dashboard-main-outer">


                <section class="admin-dashboar-nav">

                    <span class="admin-dashboar-overview">
                        <p class="overview">Overview</p>
                    </span>

                    <span class="no-admin-dashboar-overview">

                        <a href="" class="notification-logo-mark">

                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                                <rect width="24" height="24" fill="none" />
                                <g fill="none" stroke="#005BBF" stroke-width="1.5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M6 19v-9a6 6 0 0 1 6-6v0a6 6 0 0 1 6 6v9M6 19h12M6 19H4m14 0h2m-9 3h2" />
                                    <circle cx="12" cy="3" r="1" />
                                </g>
                            </svg>

                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 32 32">
                                <rect width="32" height="32" fill="none" />
                                <circle cx="16" cy="16" r="8" fill="red" />
                            </svg>

                        </a>

                        <span class="admin-dashboard-nav-txt">
                            <p class="admin-dashboard-name">${admin.fullName}</p>
                            <p class="admin-dashboard-type">${admin.role}</p>
                        </span>

                        <a href="" class="admin-dashboard-admin-logo">
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

                <article class="admin-dashboard-container">

                    <div class="admin-dashboard-all-items-overview">

                        <div id="admin-dashboard-all-item-overview-one" class="admin-dashboard-all-item-overview-box">

                            <p class="admin-dashboard-all-item-overview-total-items">Total Items</p>

                            <span class="admin-dashboard-all-items-overview-total-item-num-status">
                                <p class="admin-dashboard-all-item-overview-total-items-num"></p>
                                <p class="admin-dashboard-all-items-overview-total-item-status-only">${totalItem} ↗</p>
                            </span>

                        </div>

                        <div id="admin-dashboard-all-item-overview-two" class="admin-dashboard-all-item-overview-box">

                            <p class="admin-dashboard-all-item-overview-total-items">Pending Claims</p>

                            <span class="admin-dashboard-all-items-overview-total-item-num-status">
                                <p class="admin-dashboard-all-item-overview-total-items-num">${pendingCount}</p>
                                <p id="admin-dashboard-all-items-overview-total-item-status-only-two"
                                    class="admin-dashboard-all-items-overview-total-item-status-only"> ${pendingPercentage}% </p>
                            </span>

                        </div>

                        <div id="admin-dashboard-all-item-overview-three" class="admin-dashboard-all-item-overview-box">

                            <p class="admin-dashboard-all-item-overview-total-items">Resolved Claims</p>

                            <span class="admin-dashboard-all-items-overview-total-item-num-status">
                                <p class="admin-dashboard-all-item-overview-total-items-num">${approvedCount}</p>
                                <p id="admin-dashboard-all-items-overview-total-item-status-only-three"
                                    class="admin-dashboard-all-items-overview-total-item-status-only">${approvedPercentage}%</p>
                            </span>
                        </div>

                        <div id="admin-dashboard-all-item-overview-four" class="admin-dashboard-all-item-overview-box">

                            <p class="admin-dashboard-all-item-overview-total-items">Total Users</p>

                            <span class="admin-dashboard-all-items-overview-total-item-num-status">
                                <p class="admin-dashboard-all-item-overview-total-items-num"> <%= totalUsers %> </p>
                                <p id="admin-dashboard-all-items-overview-total-item-status-only-four"
                                    class="admin-dashboard-all-items-overview-total-item-status-only">↗</p>
                            </span>

                        </div>

                        <div id="admin-dashboard-all-item-overview-five" class="admin-dashboard-all-item-overview-box">

                            <p id="admin-dashboard-all-item-overview-five-txt"
                                class="admin-dashboard-all-item-overview-total-items">Total Reports</p>

                            <span class="admin-dashboard-all-items-overview-total-item-num-status">
                                <p id="admin-dashboard-all-item-overview-five-txt"
                                    class="admin-dashboard-all-item-overview-total-items-num">${totalReport}</p>
                                <p id="admin-dashboard-all-items-overview-total-item-status-only-five"
                                    class="admin-dashboard-all-items-overview-total-item-status-only">urgent</p>
                            </span>

                        </div>
                    </div>

                    <section class="admin-dash-main">

                        <div class="admin-dash-rescent-activity">
                            <div class="admin-dash-recent-activity-body">
                                <span class="">
                                    <p class="admin-dash-recent-activity-txt1">Recent Activity</p>
                                    <p class="admin-dash-recent-activity-txt2">Live feed of system actions and security
                                        events.</p>
                                </span>

                                <p class="admin-dash-recent-activity-view-all">View All</p>
                            </div>

                            <a href="" class="admin-dash-recent-activity-body-content">
                                <span class="admin-dash-recent-activity-body-logo">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16">
                                        <rect width="16" height="16" fill="none" />
                                        <path fill="none" stroke="#00722F" stroke-linejoin="round"
                                            d="M4.5 7.5L7 10l4.5-4.5m-9-3h11v11h-11z" stroke-width="1" />
                                    </svg>
                                </span>
                                <span class="admin-dash-ra-txt-status">
                                    <p class="admin-dash-ra-txt-1"> <b class="admin-dash-ra-txt-1-bold">Claim #8291</b>
                                        was
                                        approved by Moderator Sarah J.
                                    </p>
                                    <p class="admin-dash-ra1-status-time">Live feed of system actions and security
                                        events.</p>
                                </span>

                                <p class="admin-dash-ra1-status-time">2m ago</p>
                            </a>


                            <a href="" class="admin-dash-recent-activity-body-content">
                                <span id="admin-dash-recent-activity-body-logo-id2"
                                    class="admin-dash-recent-activity-body-logo">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <rect width="24" height="24" fill="none" />
                                        <path fill="#fff"
                                            d="M8.27 3L3 8.27v7.46L8.27 21h7.46C17.5 19.24 21 15.73 21 15.73V8.27L15.73 3M9.1 5h5.8L19 9.1v5.8L14.9 19H9.1L5 14.9V9.1m6 5.9h2v2h-2zm0-8h2v6h-2z" />
                                    </svg>
                                </span>
                                <span class="admin-dash-ra-txt-status">
                                    <p class="admin-dash-ra-txt-1"> User <b
                                            class="admin-dash-ra-txt-1-bold">@lost_soul_04</b> reported a suspicious
                                        claim.
                                    </p>
                                    <p class="admin-dash-ra1-status-time">Flagged for potential duplicate
                                        identification.
                                    </p>
                                </span>

                                <p class="admin-dash-ra1-status-time">14m ago</p>
                            </a>



                            <a href="" class="admin-dash-recent-activity-body-content">
                                <span id="admin-dash-recent-activity-body-logo-id3"
                                    class="admin-dash-recent-activity-body-logo">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <rect width="24" height="24" fill="none" />
                                        <g class="user-add-outline">
                                            <g fill="#fff" fill-rule="evenodd" class="Vector" clip-rule="evenodd">
                                                <path
                                                    d="M9.5 10a2 2 0 1 0 0-4a2 2 0 0 0 0 4m0 2a4 4 0 1 0 0-8a4 4 0 0 0 0 8m8.975-4a1 1 0 0 1 1 1v1.475h1.475a1 1 0 1 1 0 2h-1.475v1.475a1 1 0 1 1-2 0v-1.475H16a1 1 0 1 1 0-2h1.475V9a1 1 0 0 1 1-1M3.354 15.176C4.311 13.836 5.77 13 7.643 13h3.714c1.873 0 3.332.837 4.289 2.176C16.577 16.479 17 18.202 17 20a1 1 0 1 1-2 0c0-1.516-.36-2.793-.981-3.661c-.595-.832-1.457-1.339-2.662-1.339H7.643c-1.205 0-2.067.507-2.662 1.339c-.62.868-.981 2.145-.981 3.66a1 1 0 1 1-2 0c0-1.797.422-3.52 1.354-4.823" />
                                                <path d="M2 20a1 1 0 0 1 1-1h12.969a1 1 0 0 1 0 2H3a1 1 0 0 1-1-1" />
                                            </g>
                                        </g>
                                    </svg>
                                </span>
                                <span class="admin-dash-ra-txt-status">
                                    <p class="admin-dash-ra-txt-1">New moderator account created for <b
                                            class="admin-dash-ra-txt-1-bold">David Chen.</b>
                                    </p>
                                    <p class="admin-dash-ra1-status-time">Live feed of system actions and security
                                        events.</p>
                                </span>

                                <p class="admin-dash-ra1-status-time">1h ago</p>
                            </a>

                            <a href="" class="admin-dash-recent-activity-body-content">
                                <span id="admin-dash-recent-activity-body-logo-id4"
                                    class="admin-dash-recent-activity-body-logo">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <rect width="24" height="24" fill="none" />
                                        <path fill="#414754"
                                            d="M6.5 20q-2.28 0-3.89-1.57Q1 16.85 1 14.58q0-1.95 1.17-3.48q1.18-1.53 3.08-1.95q.63-2.3 2.5-3.72Q9.63 4 12 4q2.93 0 4.96 2.04Q19 8.07 19 11q1.73.2 2.86 1.5q1.14 1.28 1.14 3q0 1.88-1.31 3.19T18.5 20H13q-.82 0-1.41-.59Q11 18.83 11 18v-5.15L9.4 14.4L8 13l4-4l4 4l-1.4 1.4l-1.6-1.55V18h5.5q1.05 0 1.77-.73q.73-.72.73-1.77t-.73-1.77Q19.55 13 18.5 13H17v-2q0-2.07-1.46-3.54Q14.08 6 12 6Q9.93 6 8.46 7.46Q7 8.93 7 11h-.5q-1.45 0-2.47 1.03Q3 13.05 3 14.5T4.03 17q1.02 1 2.47 1H9v2m3-7" />
                                    </svg>
                                </span>
                                <span class="admin-dash-ra-txt-status">
                                    <p class="admin-dash-ra-txt-1">Database backup successfully synchronized.
                                    </p>
                                    <p class="admin-dash-ra1-status-time">Storage Cluster: AWS East-1 · Size: 4.2GB.</p>
                                </span>

                                <p class="admin-dash-ra1-status-time">3h ago</p>
                            </a>

                        </div>

                        <section class="admin-dash-quick-guideline">

                            <section class="admin-dash-quick-action-outer">
                                <span class="admin-dash-quick-actoion-main">
                                    <span class="admin-dash-quick-actoion-main-logo">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                            viewBox="0 0 16 16">
                                            <path fill="#007bff"
                                                d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09zM4.157 8.5H7a.5.5 0 0 1 .478.647L6.11 13.59l5.732-6.09H9a.5.5 0 0 1-.478-.647L9.89 2.41z" />
                                        </svg>
                                    </span>

                                    <p class="admin-dash-quick-actoion-main-txt">Quick Action</p>
                                </span>

                                <section class="ad-items-outer">
                                    <a href="${pageContext.request.contextPath}/ManageItem" class="admin-dash-qa-item-outer">
                                        <p class="admin-dash-ri-main-txt">Review Items</p>

                                        <span class="admin-dash-items-main-logo">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                viewBox="0 0 15 15">
                                                <rect width="15" height="15" fill="none" />
                                                <path fill="#191C23"
                                                    d="M8.293 2.293a1 1 0 0 1 1.414 0l4.5 4.5a1 1 0 0 1 0 1.414l-4.5 4.5a1 1 0 0 1-1.414-1.414L11 8.5H1.5a1 1 0 0 1 0-2H11L8.293 3.707a1 1 0 0 1 0-1.414" />
                                            </svg>
                                        </span>
                                    </a>


                                    <a href="${pageContext.request.contextPath}/ManageClaim" class="admin-dash-qa-item-outer">
                                        <p class="admin-dash-ri-main-txt">Review Claims</p>

                                        <span class="admin-dash-items-main-logo">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                viewBox="0 0 15 15">
                                                <rect width="15" height="15" fill="none" />
                                                <path fill="#191C23"
                                                    d="M8.293 2.293a1 1 0 0 1 1.414 0l4.5 4.5a1 1 0 0 1 0 1.414l-4.5 4.5a1 1 0 0 1-1.414-1.414L11 8.5H1.5a1 1 0 0 1 0-2H11L8.293 3.707a1 1 0 0 1 0-1.414" />
                                            </svg>
                                        </span>
                                    </a>

                                    <!--  -->
                                    <a href="${pageContext.request.contextPath}/ManageReports" class="admin-dash-qa-item-outer">
                                        <p class="admin-dash-ri-main-txt">View Reports</p>

                                        <span class="admin-dash-items-main-logo">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                                                viewBox="0 0 15 15">
                                                <rect width="15" height="15" fill="none" />
                                                <path fill="#191C23"
                                                    d="M8.293 2.293a1 1 0 0 1 1.414 0l4.5 4.5a1 1 0 0 1 0 1.414l-4.5 4.5a1 1 0 0 1-1.414-1.414L11 8.5H1.5a1 1 0 0 1 0-2H11L8.293 3.707a1 1 0 0 1 0-1.414" />
                                            </svg>
                                        </span>
                                    </a>
                                </section>
                            </section>

                            <section class="admin-dash-guideline-sec">
                                <a href="" class="admin-dash-guideline">
                                    <img class="guideline-img" src="image.png" alt="">
                                </a>
                            </section>
                        </section>
                    </section>
                </article>

                <!-- </section> -->
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

    <footer class="admin-all-footer">

    </footer>
</body>

</html>