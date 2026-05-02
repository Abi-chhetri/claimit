<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.claimit.model.User, java.text.SimpleDateFormat" %>
<%
User user      = (User) request.getAttribute("user");
String msg     = (String) request.getAttribute("msg");
String msgType = (String) request.getAttribute("msgType");
String action  = request.getParameter("action");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClaimIt - Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserProfile.css">
    <% if (msg != null) { %>
        <meta http-equiv="refresh" content="3;url=<%= request.getContextPath() %>/UserProfile">
    <% } %>
</head>

<body>
    <header class="header">
        <div class="header1">
            <span class="claimit-onheader">ClaimIt</span>
            <nav class="navbar">
                <a href="${pageContext.request.contextPath}/Home">Home</a>
                <a href="${pageContext.request.contextPath}/Browse">Browse</a>
                <a href="${pageContext.request.contextPath}/DashBoard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/ReportFoundItem">Report Found Item</a>
				<a href="${pageContext.request.contextPath}/MyClaim">Claims</a>
                <a href="${pageContext.request.contextPath}/About">About</a>
            </nav>
        </div>
        <div class="header2">
            <button class="noti-acc-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M19.29 17.29L18 16v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-1.29 1.29c-.63.63-.19 1.71.7 1.71h13.17c.9 0 1.34-1.08.71-1.71M16 17H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5zm-4 5c1.1 0 2-.9 2-2h-4a2 2 0 0 0 2 2" />
                </svg>
            </button>
			<form action="${pageContext.request.contextPath}/UserProfile" method="get">
			  <button class="noti-acc-button" type="submit">
			    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			      <path fill="currentColor" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
			    </svg>
			  </button>
			</form>
            <form action="${pageContext.request.contextPath}/Logout" method="post">
			    <button type="submit" class="logout-button">Logout</button>
			</form>
        </div>
    </header>

    <main class="main-content">

        <section class="profile-hero" aria-labelledby="profile-heading">
            <h1 id="profile-heading" class="profile-title">My Profile</h1>
            <p class="profile-subtitle">Manage your personal information and account security.</p>
        </section>

        <% if (msg != null) { %>
            <div class="alert alert-<%= msgType %>"><%= msg %></div>
        <% } %>

        <section class="profile-grid" aria-label="Profile sections">

            <!-- Personal Information Card -->
            <article class="card personal-info" aria-labelledby="personal-info-heading">
                <header class="card-header">
                    <h2 id="personal-info-heading" class="card-title">Personal Information</h2>
                </header>

                <%-- Full Name --%>
                <div class="info-field">
                    <div class="field-row">
                        <span class="field-label">Full Name</span>
                        <a href="${pageContext.request.contextPath}/UserProfile?action=<%= "editName".equals(action) ? "view" : "editName" %>"
                           class="edit-btn">
                            <%= "editName".equals(action) ? "✕ Cancel" : "✎ Edit" %>
                        </a>
                    </div>
                    <% if ("editName".equals(action)) { %>
                        <form action="${pageContext.request.contextPath}/UserProfile" method="post" class="inline-form">
                            <input type="hidden" name="formType" value="personalInfo" />
                            <input type="hidden" name="field" value="fullName" />
                            <input class="field-input" type="text" name="fullName"
                                   value="<%= user.getFullName() %>" required />
                            <button type="submit" class="save-btn">Save</button>
                        </form>
                    <% } else { %>
                        <span class="field-value"><%= user.getFullName() %></span>
                    <% } %>
                </div>

                <div class="field-divider"></div>

                <%-- Email - not editable --%>
                <div class="info-field">
                    <div class="field-row">
                        <span class="field-label">Email Address</span>
                        <span class="field-locked">
                            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24">
                                <path fill="#94A3B8" d="M18 8h-1V6A5 5 0 0 0 7 6v2H6a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V10a2 2 0 0 0-2-2m-6 9a2 2 0 1 1 0-4a2 2 0 0 1 0 4m3.1-9H8.9V6a3.1 3.1 0 0 1 6.2 0z"/>
                            </svg>
                            Not editable
                        </span>
                    </div>
                    <span class="field-value"><%= user.getEmail() %></span>
                </div>

                <div class="field-divider"></div>

                <%-- Phone Number --%>
                <div class="info-field">
                    <div class="field-row">
                        <span class="field-label">Phone Number</span>
                        <a href="${pageContext.request.contextPath}/UserProfile?action=<%= "editPhone".equals(action) ? "view" : "editPhone" %>"
                           class="edit-btn">
                            <%= "editPhone".equals(action) ? "✕ Cancel" : "✎ Edit" %>
                        </a>
                    </div>
                    <% if ("editPhone".equals(action)) { %>
                        <form action="${pageContext.request.contextPath}/UserProfile" method="post" class="inline-form">
                            <input type="hidden" name="formType" value="personalInfo" />
                            <input type="hidden" name="field" value="phoneNumber" />
                            <input class="field-input" type="tel" name="phoneNumber"
                                   value="<%= user.getPhoneNumber() %>" required />
                            <button type="submit" class="save-btn">Save</button>
                        </form>
                    <% } else { %>
                        <span class="field-value"><%= user.getPhoneNumber() %></span>
                    <% } %>
                </div>

                <div class="field-divider"></div>

                <div class="identity-verified" role="status">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24">
                        <path fill="#005BBF"
                            d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12c5.16-1.26 9-6.45 9-12V5zm-1 14l-3-3l1.41-1.41L11 12.17l4.59-4.58L17 9z" />
                    </svg>
                    <div class="verified-text">
                        <strong>Identity Verified</strong>
                        <p>Your identity has been verified. This helps build trust within the ClaimIt community.</p>
                    </div>
                </div>
            </article>

            <!-- Right Column -->
            <aside class="right-column">

                <!-- Concierge / Profile Picture Card -->
                <article class="card concierge-card" aria-labelledby="concierge-heading">
                    <img
                        src="<%= (user.getProfilePhoto() != null && !user.getProfilePhoto().isEmpty())
                                 ? request.getContextPath() + "/" + user.getProfilePhoto()
                                 : request.getContextPath() + "/images/BG.png" %>"
                        alt="Profile Picture"
                        class="profile-pic-preview" />
                    <div class="concierge-overlay">
                        <h2 id="concierge-heading" class="concierge-title"><%= user.getFullName() %></h2>
                        <p class="concierge-sub">Member Since <%= user.getApprovedAt() == null ? "N/A" : new SimpleDateFormat("MMM yyyy").format(user.getApprovedAt()) %></p>
                    </div>
                </article>

                <!-- Profile Picture Upload Card -->
                <article class="card preferences-card">
                    <form action="${pageContext.request.contextPath}/UserProfile"
                          method="post" enctype="multipart/form-data">
                        <input type="hidden" name="formType" value="profilePic" />
                        <% if ("uploadPic".equals(action)) { %>
                            <div class="upload-controls">
                                <input type="file" name="profilePic"
                                       accept="image/png, image/jpeg" class="file-input" />
                                <button type="submit" class="upload-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24">
                                        <path fill="#ffffff" d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/>
                                    </svg>
                                    Upload
                                </button>
                                <a href="${pageContext.request.contextPath}/UserProfile" class="cancel-upload-btn">Cancel</a>
                            </div>
                        <% } else { %>
                            <a href="${pageContext.request.contextPath}/UserProfile?action=uploadPic" class="update-pic-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/>
                                </svg>
                                Update Profile Picture
                            </a>
                        <% } %>
                    </form>
                </article>

            </aside>
        </section>

        <!-- Change Password Section -->
        <section class="change-password" aria-labelledby="password-heading">
            <header class="password-header">
                <h2 id="password-heading" class="password-title">Change Password</h2>
                <p class="password-subtitle">Update your password to keep your account secure. Use at least 8 characters.</p>
            </header>
            <form action="${pageContext.request.contextPath}/UserProfile" method="post">
                <input type="hidden" name="formType" value="changePassword" />
                <div class="password-fields">
                    <div class="field-group full-width">
                        <label class="field-label" for="current-password">Current Password</label>
                        <input class="password-input" type="password" id="current-password"
                               name="current_password" placeholder="••••••••" />
                    </div>
                    <div class="password-row">
                        <div class="field-group">
                            <label class="field-label" for="new-password">New Password</label>
                            <input class="password-input" type="password" id="new-password"
                                   name="new_password" placeholder="••••••••" />
                        </div>
                        <div class="field-group">
                            <label class="field-label" for="confirm-password">Confirm New Password</label>
                            <input class="password-input" type="password" id="confirm-password"
                                   name="confirm_password" placeholder="••••••••" />
                        </div>
                    </div>
                    <button type="submit" class="update-password-btn">Update Password</button>
                </div>
            </form>
        </section>

    </main>

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
</body>
</html>