<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${param.showReport eq 'true'}">
	<jsp:include
		page="/WEB-INF/protected_pages/views_forInclude/ReportForm.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ClaimIt - Browse</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Browse.css">


<c:if test="${not empty sessionScope.flashMessage}">
	<meta http-equiv="refresh"
		content="3;url=${pageContext.request.contextPath}/Browse">
</c:if>
</head>

<body>
	<c:if test="${not empty sessionScope.flashMessage}">
		<div class="msg-box">
			${sessionScope.flashMessage}
			<c:remove var="flashMessage" scope="session" />
		</div>
	</c:if>

	<header class="header">
		<div class="header1">
			<span class="claimit-onheader">ClaimIt</span>
			<nav class="navbar">
				<a href="${pageContext.request.contextPath}/Home">Home</a> <a
					href="${pageContext.request.contextPath}/Browse" class="active">Browse</a>
				<a href="${pageContext.request.contextPath}/DashBoard">Dashboard</a>
				<a href="${pageContext.request.contextPath}/ReportFoundItem">Report
					Found Item</a> <a href="${pageContext.request.contextPath}/MyClaim">Claims</a>
				<a href="${pageContext.request.contextPath}/About">About</a>
			</nav>
		</div>
		<div class="header2">
			<form action="${pageContext.request.contextPath}/Notification"
				method="get">
				<button type="submit" class="noti-acc-button">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24">
                        <path fill="currentColor"
							d="M19.29 17.29L18 16v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-1.29 1.29c-.63.63-.19 1.71.7 1.71h13.17c.9 0 1.34-1.08.71-1.71M16 17H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5zm-4 5c1.1 0 2-.9 2-2h-4a2 2 0 0 0 2 2" />
                    </svg>
				</button>
			</form>
			<form action="${pageContext.request.contextPath}/UserProfile"
				method="get">
				<button class="noti-acc-button" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24">
                        <path fill="currentColor"
							d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
                    </svg>
				</button>
			</form>
		</div>
	</header>

	<main class="main-page">

		<section class="search-date">
			<h1 class="browse-title">Browse Items</h1>
			<p class="browse-subtitle">Reconnecting lost belongings with
				their owners through a modern network of care.</p>

			<form action="${pageContext.request.contextPath}/Browse" method="GET">
				<div class="search-bar-row">

					<div class="search-group">
						<label for="keyword">Keyword Search</label>
						<div class="search-input-wrapper">
							<%--
                                Re-populate the search field with whatever the user last typed
                                using the "keyword" request parameter via EL.
                            --%>
							<input type="text" id="keyword" name="keyword"
								placeholder="What are you looking for?"
								value="${fn:trim(param.keyword)}" />
						</div>
					</div>

					<div class="date-group">
						<label for="dateRange">Date Range</label>
						<div class="date-input-wrapper">
							<%--
                                Each option checks if its value matches the current "dateRange"
                                param; if so, marks itself as selected to persist the user's choice.
                            --%>
							<select id="dateRange" name="dateRange">
								<option value=""
									<c:if test="${empty param.dateRange}">selected</c:if>>All
									Time</option>
								<option value="7"
									<c:if test="${param.dateRange eq '7'}">selected</c:if>>Last
									7 Days</option>
								<option value="30"
									<c:if test="${param.dateRange eq '30'}">selected</c:if>>Last
									30 Days</option>
								<option value="90"
									<c:if test="${param.dateRange eq '90'}">selected</c:if>>Last
									90 Days</option>
								<option value="180"
									<c:if test="${param.dateRange eq '180'}">selected</c:if>>Last
									6 Months</option>
								<option value="365"
									<c:if test="${param.dateRange eq '365'}">selected</c:if>>Last
									1 Year</option>
							</select> <span class="calendar-icon"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24">
                                    <path fill="#000"
										d="M7 11h2v2H7zm14-5v14c0 1.1-.9 2-2 2H5a2 2 0 0 1-2-2l.01-14c0-1.1.88-2 1.99-2h1V2h2v2h8V2h2v2h1c1.1 0 2 .9 2 2M5 8h14V6H5zm14 12V10H5v10zm-4-7h2v-2h-2zm-4 0h2v-2h-2z" />
                                </svg>
							</span>
						</div>
					</div>

					<div class="search-btn-group">
						<button type="submit" class="search-submit-btn">Search</button>
						<a href="${pageContext.request.contextPath}/Browse"
							class="clear-btn">Clear</a>
					</div>

				</div>
			</form>
		</section>

		<section class="cards-section">

			<%--
                A search is considered active if either the keyword or dateRange
                param is non-empty. Used to conditionally show the result count bar
                and context-aware empty messages below.
            --%>
			<c:set var="isSearching"
				value="${not empty param.keyword or not empty param.dateRange}" />

			<%--
                Only shown when a search is active. Displays how many FOUND items
                were returned (resultCount pre-computed in the servlet), and echoes
                back the keyword and/or date range the user searched for.
            --%>
			<c:if test="${isSearching}">
				<p class="results-count">
					<%-- Pluralize "result/results" based on count --%>
					${requestScope.resultCount} result
					<c:if test="${requestScope.resultCount ne 1}">s</c:if>
					found
					<c:if test="${not empty param.keyword}">
                        for "<strong>${param.keyword}</strong>"
                    </c:if>
					<c:if test="${not empty param.dateRange}">
                        in the last ${param.dateRange} days
                    </c:if>
				</p>
			</c:if>

			<div class="cards-grid">

				<%--
                    If the servlet returned no items at all, show a generic empty message
                    and skip the loop entirely.
                --%>
				<c:choose>
					<c:when test="${empty requestScope.items}">
						<p class="no-results-msg">No items found. Try adjusting your
							search.</p>
					</c:when>

					<c:otherwise>
						<%--
                            Only render a card if the item type is "FOUND" AND its
                            status is "APPROVED" — other types (LOST) and pending/rejected
                            items are silently skipped.
                        --%>
						<c:set var="anyFound" value="false" />

						<c:forEach var="item" items="${requestScope.items}">

							<%-- Filter: show only approved FOUND items --%>
							<c:if
								test="${item.type eq 'FOUND' and item.status eq 'APPROVED'}">
								<c:set var="anyFound" value="true" />

								<c:set var="images"
									value="${requestScope.itemImagesMap[item.itemId]}" />
								<c:set var="firstImage"
									value="${not empty images ? images[0].imagePath : ''}" />

								<article class="item-card">
									<div class="card-image">
										<img src="${pageContext.request.contextPath}/${firstImage}"
											style="width: 100%; height: 100%; object-fit: cover; display: block;">
										<span class="badge found">${item.type}</span>
									</div>
									<div class="card-body">
										<span class="card-category">${item.category}</span>
										<h2 class="card-title">${item.title}</h2>
										<p class="card-location">&#128205; ${item.location}</p>

										<p class="card-date">
											&#128336;
											<fmt:formatDate value="${item.lostFoundDate}"
												pattern="MMM dd, yyyy" />
										</p>

										<form action="${pageContext.request.contextPath}/ViewDetails"
											method="POST">
											<input type="hidden" name="itemId" value="${item.itemId}" />
											<button class="view-details-btn" type="submit">View
												Details</button>
										</form>

										<%--
                                            Only show "Report This Item" if the logged-in user
                                            is NOT the owner of this item. Prevents users from
                                            reporting their own uploads. Hidden if not logged in.
                                        --%>
										<c:if
											test="${not empty sessionScope.userId and sessionScope.userId ne item.userId}">
											<form action="${pageContext.request.contextPath}/Browse"
												method="get">
												<input type="hidden" name="showReport" value="true" /> <input
													type="hidden" name="itemId" value="${item.itemId}" />
												<button type="submit" class="report-item-btn">Report
													This Item</button>
											</form>
										</c:if>

									</div>
								</article>
							</c:if>

						</c:forEach>

						<%--
                            After iterating, if no FOUND+APPROVED item was rendered:
                            - If a search was active → tell the user no items matched their filters.
                            - If no search was active → tell the user no items have been uploaded yet.
                        --%>
						<c:if test="${not anyFound}">
							<c:choose>
								<c:when test="${isSearching}">
									<p class="no-results-msg">No items match your search. Try
										different keywords or a wider date range.</p>
								</c:when>
								<c:otherwise>
									<p class="no-results-msg">No Item Uploaded to show.</p>
								</c:otherwise>
							</c:choose>
						</c:if>

					</c:otherwise>
				</c:choose>

			</div>
		</section>

	</main>

	<footer class="site-footer">
		<div class="footer-left">
			<span class="footer-brand">ClaimIt</span>
		</div>
		<div class="footer-middle">
			<a href="#">Privacy Policy</a> <a href="#">Terms of Service</a> <a
				href="#">Help Center</a> <a href="#">Contact Us</a>
		</div>
		<div class="footer-right">
			<p>&copy; 2026 ClaimIt Protocol. All rights reserved.</p>
		</div>
	</footer>

</body>
</html>