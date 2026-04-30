<%@page import="com.claimit.services.ItemImageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.claimit.model.Item, java.util.List ,com.claimit.model.ItemImage"%>

<%
List<Item> items = (List<Item>) request.getAttribute("items");
%>
<%
    String showReport = request.getParameter("showReport");
    if ("true".equals(showReport)) {
        request.getRequestDispatcher("/WEB-INF/protected_pages/views_forInclude/ReportForm.jsp")
               .include(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ClaimIt - Browse</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Browse.css">
<%
String flash = (String) session.getAttribute("flashMessage");
if (flash != null) {
%>
<meta http-equiv="refresh"
	content="3;url=${pageContext.request.contextPath}/Browse">
<%
}
%>

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
	<header class="header">
		<div class="header1">
			<span class="claimit-onheader">ClaimIt</span>
			<nav class="navbar">
				<a href="${pageContext.request.contextPath}/Home">Home</a> <a
					href="${pageContext.request.contextPath}/Browse">Browse</a> <a
					href="${pageContext.request.contextPath}/DashBoard">Dashboard</a> <a
					href="${pageContext.request.contextPath}/ReportFoundItem">Report
					Found Item</a> <a href="${pageContext.request.contextPath}/Claims">Claims</a>
				<a href="${pageContext.request.contextPath}/About">About</a>
			</nav>
		</div>
		<div class="header2">
			<button class="noti-acc-button">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24">
                    <path fill="currentColor"
						d="M19.29 17.29L18 16v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-1.29 1.29c-.63.63-.19 1.71.7 1.71h13.17c.9 0 1.34-1.08.71-1.71M16 17H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5zm-4 5c1.1 0 2-.9 2-2h-4a2 2 0 0 0 2 2" />
                </svg>
			</button>
			<button class="noti-acc-button">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24">
                    <path fill="currentColor"
						d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
                </svg>
			</button>
		</div>
	</header>

	<main class="main-page">

		<section class="search-date">
			<h1 class="browse-title">Browse Items</h1>
			<p class="browse-subtitle">Reconnecting lost belongings with
				their owners through a modern network of care.</p>

			<div class="search-bar-row">
				<div class="search-group">
					<label for="keyword">Keyword Search</label>
					<div class="search-input-wrapper">
						<input type="text" id="keyword" name="keyword"
							placeholder="What are you looking for?" />
					</div>
				</div>
				<div class="date-group">
					<label for="date-range">Date Range</label>
					<div class="date-input-wrapper">
						<input type="text" id="date-range" name="date_range"
							placeholder="Last 30 Days" /> <span class="calendar-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                                <path fill="#000"
									d="M7 11h2v2H7zm14-5v14c0 1.1-.9 2-2 2H5a2 2 0 0 1-2-2l.01-14c0-1.1.88-2 1.99-2h1V2h2v2h8V2h2v2h1c1.1 0 2 .9 2 2M5 8h14V6H5zm14 12V10H5v10zm-4-7h2v-2h-2zm-4 0h2v-2h-2z" />
                            </svg>
						</span>
					</div>
				</div>
			</div>
		</section>

		<section class="cards-section">
			<div class="cards-grid">
				<%
				for (Item item : items) {
					ItemImageService itemImageService = new ItemImageService();
					List<ItemImage> images = itemImageService.getImagesByItemId(item.getItemId());
					if (item.getType().equals("FOUND")) {
				%>
				<article class="item-card">
					<div class="card-image">
						<img
							src="${pageContext.request.contextPath}/<%=!images.isEmpty() ? images.get(0).getImagePath() : ""%>"
							style="width: 100%; height: 100%; object-fit: cover; display: block;">
						<span class="badge found"><%=item.getType()%></span>
					</div>
					<div class="card-body">
						<span class="card-category"><%=item.getCategory()%></span>
						<h2 class="card-title"><%=item.getTitle()%></h2>
						<p class="card-location">
							&#128205;
							<%=item.getLocation()%></p>
						<p class="card-date">
							&#128336;
							<%=item.getLostFoundDate()%></p>
						<form action="${pageContext.request.contextPath}/ViewDetails"
							method="POST">
							<input type="hidden" name="itemId" value="<%=item.getItemId()%>" />
							<button class="view-details-btn" type="submit">View
								Details</button>
						</form>
						<!-- Report This Item -->
						<a
							href="<%= request.getContextPath()%>/Browse?showReport=true&itemId=<%= item.getItemId() %>"
							class="report-item-btn">Report This Item</a>
					</div>
				</article>
				<%
				}
				}
				%>
			</div>
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