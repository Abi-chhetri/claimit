<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="adminId"
	value="${userId == null ? sessionScope.adminId : null}" />
<c:set var="item" value="${requestScope.item}" />
<c:set var="images" value="${requestScope.itemImages}" />
<c:set var="msg" value="${requestScope.msg}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:if test="${not empty msg or not empty err}">
	<meta http-equiv="refresh"
		content="3;url=${pageContext.request.contextPath}/Browse">
</c:if>
<title>ClaimIt - Browse - View Details</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ViewDetailsPage.css">
</head>
<body>
	<header class="header">
		<div class="header1">
			<span class="claimit-onheader">ClaimIt</span>
			<nav class="navbar">
				<a href="${pageContext.request.contextPath}/Home">Home</a> <a
					href="${pageContext.request.contextPath}/Browse">Browse</a> <a
					href="${pageContext.request.contextPath}/DashBoard">Dashboard</a> <a
					href="${pageContext.request.contextPath}/ReportFoundItem">Report
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
			<form action="${pageContext.request.contextPath}/Logout"
				method="post">
				<button type="submit" class="logout-button">Logout</button>
			</form>
		</div>
	</header>

	<main class="main-page">

		<c:if test="${not empty msg}">
			<div
				class="claim-msg-box">
				${msg}</div>
		</c:if>
		
		<c:if test="${not empty err}">
			<div
				class="claim-msg-error">
				${err}</div>
		</c:if>

		<c:choose>
			<c:when test="${userId != null}">
				<a href="${pageContext.request.contextPath}/Browse"
					class="back-link"> <svg xmlns="http://www.w3.org/2000/svg"
						width="20px" height="20px" viewBox="0 0 24 24">
						<path fill="#005BBF"
							d="M20 11H7.83l5.59-5.59L12 4l-8 8l8 8l1.41-1.41L7.83 13H20z" />
						</svg>Back to Browse
				</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/ManageItem"
					class="back-link"> <svg xmlns="http://www.w3.org/2000/svg"
						width="20px" height="20px" viewBox="0 0 24 24">
						<path fill="#005BBF"
							d="M20 11H7.83l5.59-5.59L12 4l-8 8l8 8l1.41-1.41L7.83 13H20z" />
						</svg>Back to Manage Item
				</a>
			</c:otherwise>
		</c:choose>

		<section class="detail-section">

			<div class="detail-left">
				<figure class="main-image">
					<div class="main-image-bg">
						<img
							src="${not empty images ? images[0].imagePath : ''}"
							alt=""> <span class="badge found">Found</span>
					</div>
				</figure>

				<div class="thumbnails">

					<c:set var="len" value="${images.size() < 3 ? images.size() : 3}" />

					<c:if test="${not empty images}">
					    <c:set var="len" value="${images.size() < 3 ? images.size() : 3}" />
					
					    <c:forEach var="img" items="${images}" begin="0" end="${len - 1}">
					        <figure class="thumb">
					            <img src="${img.imagePath}" alt="Item Image">
					        </figure>
					    </c:forEach>
					</c:if>

					<figure class="thumb-more">${len - 3 < 0 ? 0 : len - 3}+
						more
					</figure>

				</div>
			</div>

			<article class="detail-right">

				<p class="item-id">${item.type}ITEM#${item.itemId}</p>

				<h1 class="item-title">${item.title}</h1>

				<p class="item-desc">${item.description}</p>

				<dl class="info-rows">

					<div class="info-row">
						<div class="info-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								viewBox="0 0 24 24" fill="#1a6fd4">
							<path
									d="M4 8h16v2H4zm2-4h12v2H6zm14 8H4c-1.1 0-2 .9-2 2v4c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2v-4c0-1.1-.9-2-2-2zm-7 5.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z" />
							</svg>
						</div>
						<div class="info-text">
							<dt class="info-label">CATEGORY</dt>
							<dd class="info-value">${item.category}</dd>
						</div>
					</div>

					<div class="info-row">
						<div class="info-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								viewBox="0 0 24 24" fill="#1a6fd4">
							<path
									d="M7 11h2v2H7zm14-5v14c0 1.1-.9 2-2 2H5a2 2 0 0 1-2-2l.01-14c0-1.1.88-2 1.99-2h1V2h2v2h8V2h2v2h1c1.1 0 2 .9 2 2M5 8h14V6H5zm14 12V10H5v10zm-4-7h2v-2h-2zm-4 0h2v-2h-2z" />
							</svg>
						</div>
						<div class="info-text">
							<dt class="info-label">DATE FOUND</dt>
							<dd class="info-value">
								<fmt:formatDate value="${item.lostFoundDate}"
									pattern="MMM dd, yyyy" />
							</dd>
						</div>
					</div>

					<div class="info-row">
						<div class="info-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								viewBox="0 0 24 24" fill="#1a6fd4">
							<path
									d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
							</svg>
						</div>
						<div class="info-text">
							<dt class="info-label">LOCATION</dt>
							<dd class="info-value">${item.location}</dd>
						</div>
					</div>

				</dl>

				<div class="poster-row">
					<figure class="avatar">
						<img
							src="${empty user.profilePhoto ? pageContext.request.contextPath.concat('/images/BG.png') : user.profilePhoto}"
							alt="${user.fullName}" />
					</figure>

					<div class="poster-info">
						<span class="poster-label">POSTED BY</span> <span
							class="poster-name">${user.fullName}</span>
					</div>

					<div class="verified">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 24 24" fill="#16a34a">
						<path
								d="M12 2L3 7v5c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5zm-1 13l-3-3 1.41-1.41L11 12.17l4.59-4.58L17 9l-6 6z" />
						</svg>
						Verified
					</div>
				</div>

				<c:if
					test="${userId != null && userId != item.userId && adminId == null}">
					<button class="claim-btn"
						onclick="document.getElementById('claimModal').classList.add('active')">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							viewBox="0 0 24 24" fill="currentColor">
						<path
								d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z" />
						</svg>
						Claim This Item
					</button>

					<p class="claim-note">Verification of ownership will be
						required upon claiming.</p>
				</c:if>

			</article>
		</section>
	</main>
</body>
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

<!-- Claim Modal -->
<div class="claim-modal-overlay" id="claimModal">
	<div class="claim-modal">
		<div class="claim-modal-header">
			<h2>Claim This Item</h2>
			<button class="claim-modal-close"
				onclick="
					    document.getElementById('claimModal').classList.remove('active');
					    document.querySelector('.claim-form').reset();
					    document.getElementById('fileName').textContent = 'No file chosen';
					    document.getElementById('proof-error').style.display = 'none';
					">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					viewBox="0 0 24 24" fill="#475569">
                    <path
						d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" />
                </svg>
			</button>
		</div>
		<p class="claim-modal-subtitle">
			Please provide details to verify your ownership of <strong>${item.title}</strong>.
		</p>

		<form class="claim-form" method="POST"
			action="${pageContext.request.contextPath}/Claims"
			enctype="multipart/form-data">
			<input type="hidden" name="itemId" value="${item.itemId}" />

			<div class="claim-field">
				<label for="ownershipDescription">Describe your ownership</label>
				<textarea id="ownershipDescription" name="ownershipDescription"
					rows="4"
					placeholder="Describe unique details about the item that prove it belongs to you (like image with this item of you or image of this item which is not here and where did you lose this item. )..."
					></textarea>
			</div>

			<div class="claim-field">
				<label for="proofImage">Upload proof image</label>
				<div class="claim-file-wrap">
					<input type="file" id="proofImage" name="proofImage"
						accept="image/png, image/jpeg" multiple /> <label
						for="proofImage" class="claim-file-label"> <svg
							xmlns="http://www.w3.org/2000/svg" width="18" height="18"
							viewBox="0 0 24 24" fill="#475569">
				                <path
								d="M19.35 10.04A7.49 7.49 0 0 0 12 4C9.11 4 6.6 5.64 5.35 8.04A5.994 5.994 0 0 0 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM14 13v4h-4v-4H7l5-5 5 5h-3z" />
				            </svg> Choose a file
					</label> <span class="claim-file-name" id="fileName">No file chosen</span>
				</div>
			</div>

			<div class="claim-modal-actions">
				<button type="button" class="claim-cancel-btn"
					onclick="
							    document.getElementById('claimModal').classList.remove('active');
							    document.querySelector('.claim-form').reset();
							    document.getElementById('fileName').textContent = 'No file chosen';
							    document.getElementById('proof-error').style.display = 'none';
							">Cancel</button>
				<button type="submit" class="claim-submit-btn">Submit Claim</button>
			</div>
		</form>
	</div>
</div>
<script>
		document
				.getElementById('proofImage')
				.addEventListener(
						'change',
						function() {
							const count = this.files.length;
							document.getElementById('fileName').textContent = count === 0 ? 'No file chosen'
									: count === 1 ? this.files[0].name : count
											+ ' files selected';
						});
	</script>
</html>