<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.claimit.model.ContactMessage, java.util.List , java.text.SimpleDateFormat" %>
<% List<ContactMessage> messages= (List<ContactMessage>) request.getAttribute("contactMessage");%>
<%
String suc=(String) request.getAttribute("suc");
String err=(String) request.getAttribute("err");
int read=0;
int unRead=0;
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact-message.css" />
</head>

<body>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%if(suc != null || err != null){ %>
	    <meta http-equiv="refresh" content="3">
	    <%} %>
        <title> Admin Dashboard </title>
        <link rel="stylesheet" href="Admin-logs.css">
    </head>

    <body>

        <aside>
            <section class="admin-aside-outer">
                <div class="admin-aside-claimit-console">

                    <p class="claimit-admin-console">ClaimIt Admin<br> Console</p>
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
                        <a href="${pageContext.request.contextPath}/ManageModerator" class="admin-functions">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 8 8">
                                <rect width="8" height="8" fill="none" />
                                <path fill="#475569" d="M4 4v3q2 0 3-3M4 4V1L1 2v2m3-4l4 2c0 8-8 8-8 0" />
                            </svg>

                            <p class="admin-function-name">Manage Moderators</p>
                        </a>
                    </div>

                    <div class="admin-aside-admin-function">
                        <a href="${pageContext.request.contextPath}/ManageContactMessage" class="admin-functions active-nav">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                                <rect width="32" height="32" fill="none" />
                                <path fill="#475569"
                                    d="M2.004 9.303A4.5 4.5 0 0 1 6.5 5h19a4.5 4.5 0 0 1 4.496 4.303l-1.476.82L16 16.864L3.48 10.123zM2 11.588V22.5A4.5 4.5 0 0 0 6.5 27h19a4.5 4.5 0 0 0 4.5-4.5V11.588l-.526.293l-13 7a1 1 0 0 1-.948 0L2.514 11.874z" />
                            </svg>

                            <p class="admin-function-cont">Contact Messages</p>
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

                    <div id="admin-logo" class="adminlog">
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
            </section>

            <section class="rightside">
                <header class="head">
                    <span>ClaimIt</span>
                    <div class="header2">
                        <span class="Acti">Admin</span>
                        <button class="noti-acc-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path fill="currentColor"
                                    d="M19.29 17.29L18 16v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-1.29 1.29c-.63.63-.19 1.71.7 1.71h13.17c.9 0 1.34-1.08.71-1.71M16 17H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5zm-4 5c1.1 0 2-.9 2-2h-4a2 2 0 0 0 2 2" />
                            </svg>
                        </button>
                        <button class="noti-acc-button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24">
                                <path fill="currentColor"
                                    d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
                            </svg></button>
                    </div>
                </header>


                <section class="leftside">
                    <h1>Contact Message</h1>
                    <p>Review and manage inqueries from the Digital Concierge<br>
                        portal.Maintain the editorial standard of response.</p>
                </section>

                <section class="table-container">
                <% if(suc != null){ %>
				<p style="background:#ECFDF5; color:#065F46; border:1px solid #6EE7B7; border-radius:8px; padding:10px 16px; text-align:center; font-size:14px; font-weight:500; margin-bottom:16px;">
				    <%= suc %>
				</p>
				<%} %>
				<% if(err != null){ %>
				    <p style="background:#FEF2F2; color:#991B1B; border:1px solid #FCA5A5; border-radius:8px; padding:10px 16px; text-align:center; font-size:14px; font-weight:500; margin-bottom:16px;">
				        <%= err %>
				    </p>
				<%} %>

                    <div class="table-header">
                        <span>ID</span>
                        <span>SENDER</span>
                        <span>MESSAGE PREVIEW</span>
                        <span>DATE</span>
                        <span>STATUS</span>
                        <span>ACTION</span>
                    </div>
                    <%for(ContactMessage each: messages){ 
                    	if(!each.getIsRead()){
                    		unRead++;
                    %>
                    <div class="row">
                        <div class="MSG">MSG-<%=each.getContactMessageId() %></div>

                        <div class="sender">
                            <div class="avatar-un"><%= each.getEmail().substring(0,2).toUpperCase() %></div>
                            <div class="sender-info">
                                <%= each.getUserId() == 0 ? "N/A" : each.getUserId() %>
                                <span><%= each.getEmail()%></span>
                            </div>
                        </div>

                        <div>
                            <div class="message-title"><%= each.getMessage().substring(0,11) %></div>
                            <div class="message-desc">
                            	<%= each.getMessage() %>
                            </div>
                        </div>

                        <div class="date">
                            <%= new SimpleDateFormat("MMM dd, yyyy").format(each.getSubmittedAt()) %>
                            <span><%= new SimpleDateFormat("HH:mm a").format(each.getSubmittedAt()) %></span>
                        </div>

                        <div>
                            <span class="status-unread">Unread</span>
                        </div>

                         <div>
                            <form action="${pageContext.request.contextPath}/ManageContactMessage" method="POST">
							    <input type="hidden" name="messageId" value="<%= each.getContactMessageId() %>">
							    <button type="submit" class="btnact">Mark as Read</button>
							</form>
                        </div>
                    </div>
                    <%}else{  read++;%>
                    <div class="row">
                        <div class="MSG">MSG-<%=each.getContactMessageId() %> </div>

                        <div class="sender">
                            <div class="avatar"><%= each.getEmail().substring(0,2).toUpperCase() %></div>
                            <div class="sender-info">
                                <%= each.getUserId() == 0 ? "N/A" : each.getUserId() %>
                                <span><%= each.getEmail()%></span>
                            </div>
                        </div>

                        <div>
                            <div class="message-title"><%= each.getMessage().substring(0,11) %></div>
                            <div class="message-desc">
                                <%= each.getMessage() %>
                            </div>
                        </div>


                        <div class="date">
                            <%= new SimpleDateFormat("MMM dd, yyyy").format(each.getSubmittedAt()) %>
                            <span><%= new SimpleDateFormat("HH:mm a").format(each.getSubmittedAt()) %></span>
                        </div>

                        <div>
                            <span class="status-read">Read</span>
                        </div>

                        <div>
                            <button class="gray">N/A</button>
                        </div>
                    </div>
                    
                    <%}} %>
                </section>

                <section class="Message-bottom">
                    <div class="left-side">
                        <div class="icon blue">
                            <img src="${pageContext.request.contextPath}/images/mail.jpg" alt="Email logo">
                        </div>
                        <div class="text">
                            <p>UNREAD MESSAGE</p>
                            <h1><%=unRead %></h1>
                        </div>
                    </div>

                    <div class="right-side">
                        <div class="icon green">
                            <img src="${pageContext.request.contextPath}/images/tick.jpg" alt="check logo">
                        </div>
                        <div>
                            <div class="text">
                                <p>READ</p>
                                <span><%=read %></span>
                            </div>
                        </div>
                    </div>
                </section>


                <footer class="site-footer">
                    <div class="footer-left">
                        <span class="footer-brand">ClaimIt</span>
                    </div>
                    <div class="footer-middle">
                        <a href="#">Privacy Policy</a>
                        <a href="#">Terms of Service</a>
                        <a href="#">Help Center</a>
                        <a href="#">Contact Us</a>
                    </div>
                    <div class="footer-right">
                        <p>&copy; 2026 ClaimIt Protocol. All rights reserved.</p>
                    </div>
                </footer>
            </section>
        </aside>



    </body>

    </html>
</body>

</html>