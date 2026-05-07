<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
Integer userId=(Integer) request.getAttribute("userId"); 
String erMsg= (String) request.getAttribute("erMsg");
String suc = (String) request.getAttribute("suc");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%if(suc != null){ %>
    <meta http-equiv="refresh" content="3">
    <%} %>
    <title>ClaimIt - About</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AboutPage.css">
</head>

<body>
    <header class="header">
        <div class="header1">
            <span class="claimit-onheader">ClaimIt</span>
            <nav class="navbar">
                <%if(userId == null){ %>
                <a href="${pageContext.request.contextPath}/Home">Home</a>
				<a href="${pageContext.request.contextPath}/About" class="Active">About</a> 
				<a href="${pageContext.request.contextPath}/Login"> Login</a> 
				<a href="${pageContext.request.contextPath}/Register">Registration</a>
                <%} else{%>
                <a href="${pageContext.request.contextPath}/Home">Home</a>
                <a href="${pageContext.request.contextPath}/Browse">Browse</a>
                <a href="${pageContext.request.contextPath}/DashBoard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/ReportFoundItem">Report Found Item</a>
                <a href="${pageContext.request.contextPath}/MyClaim">Claims</a>
                <a href="${pageContext.request.contextPath}/About" class="Active">About</a>
                <%} %>
            </nav>
        </div>
        <%if(userId != null){ %>
        <div class="header2">
			<form action="${pageContext.request.contextPath}/Notification" method="get">
			    <button type="submit" class="noti-acc-button">
			        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			            <path fill="currentColor"
			                d="M19.29 17.29L18 16v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-1.29 1.29c-.63.63-.19 1.71.7 1.71h13.17c.9 0 1.34-1.08.71-1.71M16 17H8v-6c0-2.48 1.51-4.5 4-4.5s4 2.02 4 4.5zm-4 5c1.1 0 2-.9 2-2h-4a2 2 0 0 0 2 2" />
			        </svg>
			    </button>
			</form>
			<form action="${pageContext.request.contextPath}/UserProfile" method="get">
			  <button class="noti-acc-button" type="submit">
			    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
			      <path fill="currentColor" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
			    </svg>
			  </button>
			</form>
        </div>
        <%} %>
    </header>
    <% if(suc != null){ %>
	<p style="background:#ECFDF5; color:#065F46; border:1px solid #6EE7B7; border-radius:8px; padding:10px 16px; text-align:center; font-size:14px; font-weight:500; margin-bottom:16px;">
	    <%= suc %>
	</p>
	<% } %>
    <main class="main-content">
        <section class="about-hero">
            <div class="about-left">
                <span class="about-tag">OUR STORY</span>
                <h1 class="about-heading">About<span class="about-heading-blue"> ClaimIt</span></h1>
                <p class="about-desc">Redefining the lost and found experience with a premium, digital-first approach.
                    We connect missing memories with their rightful owners through an elegant, high-trust ecosystem.</p>
                <button class="about-btn" onclick="window.location.href='${pageContext.request.contextPath}/Browse'">Start Searching</button>
            </div>
            <div class="about-right">
                <div class="about-image-wrapper">
                    <div class="about-image-placeholder">
                    	<img alt="handshake" width="100%" height="500px" src="${pageContext.request.contextPath}/images/group.jpg">
                    </div>
                    <div class="about-float-card">
                        <div class="about-float-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path fill="#FFFFFF"
                                    d="M23 11.99L20.56 9.2l.34-3.69l-3.61-.82L15.4 1.5L12 2.96L8.6 1.5L6.71 4.69L3.1 5.5l.34 3.7L1 11.99l2.44 2.79l-.34 3.7l3.61.82l1.89 3.2l3.4-1.47l3.4 1.46l1.89-3.19l3.61-.82l-.34-3.69zm-3.95 1.48l-.56.65l.08.85l.18 1.95l-1.9.43l-.84.19l-.44.74l-.99 1.68l-1.78-.77l-.8-.34l-.79.34l-1.78.77l-.99-1.67l-.44-.74l-.84-.19l-1.9-.43l.18-1.96l.08-.85l-.56-.65L3.67 12l1.29-1.48l.56-.65l-.09-.86l-.18-1.94l1.9-.43l.84-.19l.44-.74l.99-1.68l1.78.77l.8.34l.79-.34l1.78-.77l.99 1.68l.44.74l.84.19l1.9.43l-.18 1.95l-.08.85l.56.65l1.29 1.47z" />
                                <path fill="#FFFFFF"
                                    d="m10.09 13.75l-2.32-2.33l-1.48 1.49l3.8 3.81l7.34-7.36l-1.48-1.49z" />
                            </svg>
                        </div>
                        <div class="about-float-text">
                            <span class="about-float-title">99.9% Authenticity</span>
                            <span class="about-float-sub">Verified Claim Verification</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <main class="main-content2">
        <section class="mission-section">
            <div class="mission-header">
                <span class="mission-tag">THE NORTH STAR</span>
                <h2 class="mission-title">Our mission is to bring empathy back to organization.</h2>
            </div>
            <div class="mission-cards">
                <article class="mission-card">
                    <img src="${pageContext.request.contextPath}/images/group.jpg" alt="Community First" width="35" height="35" />
                    <h3 class="mission-card-title">Community First</h3>
                    <p class="mission-card-desc">We believe every lost item is a story waiting for a happy ending,
                        powered by a community that cares.</p>
                </article>
                <article class="mission-card">
                    <img src="${pageContext.request.contextPath}/images/head.jpeg" alt="Absolute Privacy" width="35" height="35" />
                    <h3 class="mission-card-title">Absolute Privacy</h3>
                    <p class="mission-card-desc">Your data and personal details are handled with the highest level of
                        encryption and professional discretion.</p>
                </article>
                <article class="mission-card">
                    <img src="${pageContext.request.contextPath}/images/speed.jpeg" alt="Rapid Recovery" width="35" height="35" />
                    <h3 class="mission-card-title">Rapid Recovery</h3>
                    <p class="mission-card-desc">Our smart matching algorithms connect found items with reports in
                        real-time, cutting recovery days by 70%.</p>
                </article>
            </div>
        </section>

        <section class="process-section">
            <div class="process-header">
                <h2 class="process-title">The Concierge Process</h2>
                <p class="process-subtitle">Three simple steps to bridge the gap between lost and found.</p>
            </div>
            <div class="process-steps">
                <div class="process-step">
                    <div class="process-icon-wrapper">
                        <span class="process-step-number">1</span>
                        <img src="${pageContext.request.contextPath}/images/cam.jpeg" alt="Report" width="48" height="40" class="process-icon" />
                    </div>
                    <h3 class="process-step-title">Report</h3>
                    <p class="process-step-desc">Snap a photo and provide a few key details. Our AI assists with
                        categorizing your report instantly.</p>
                </div>
                <div class="process-step">
                    <div class="process-icon-wrapper">
                        <span class="process-step-number">2</span>
                        <img src="${pageContext.request.contextPath}/images/globe.jpeg" alt="Browse" width="48" height="40" class="process-icon" />
                    </div>
                    <h3 class="process-step-title">Browse</h3>
                    <p class="process-step-desc">Search our verified database of found items filtered by location, date,
                        and category descriptions.</p>
                </div>
                <div class="process-step">
                    <div class="process-icon-wrapper">
                        <span class="process-step-number">3</span>
                        <img src="${pageContext.request.contextPath}/images/shake.jpeg" alt="Claim" width="48" height="40" class="process-icon" />
                    </div>
                    <h3 class="process-step-title">Claim</h3>
                    <p class="process-step-desc">Verify ownership through our secure messaging system and arrange for a
                        safe return or pickup.</p>
                </div>
            </div>
        </section>

        <section class="team-section">
            <div class="team-header">
                <span class="team-tag">OUR CURATORS</span>
                <h2 class="team-title">Meet the Minds Behind ClaimIt</h2>
            </div>
			<div class="team-grid">
				<div class="team-card">
					<div class="team-photo">
						<img src="${pageContext.request.contextPath}/images/abi.jpg" width="100%" style="object-fit:cover; object-position:center" height="280px">
					</div>
					<h4 class="team-name">Abi Loniya</h4>
				</div>
				<div class="team-card">
					<div class="team-photo">
						<img src="${pageContext.request.contextPath}/images/Gaurav.jpg" alt="" width="100%" height="280px">
					</div>
					<h4 class="team-name">Gaurav Chaudhary</h4>

				</div>
				<div class="team-card">
					<div class="team-photo">
						<img src="${pageContext.request.contextPath}/images/" alt="" width="100%" height="280px">
					</div>
					<h4 class="team-name">Shivam Jaiswal</h4>

				</div>
				<div class="team-card">
					<div class="team-photo">
						<img src="${pageContext.request.contextPath}/images/" alt="" width="100%" height="280px">
					</div>
					<h4 class="team-name">Sajal Dangal</h4>

				</div>
				<div class="team-card">
					<div class="team-photo">
						<img src="${pageContext.request.contextPath}/images/sachin.jpg" alt="" width="100%" height="280px">
					</div>
					<h4 class="team-name">Sachin Jaiswal</h4>

				</div>
			</div>
		</section>
        
        <section class="contact-section" id="contact">
		    <div class="contact-header">
		        <span class="contact-tag">GET IN TOUCH</span>
		        <h2 class="contact-title">Contact Us</h2>
		        <p class="contact-subtitle">Have a question or need help? We'd love to hear from you.</p>
		    </div>
		    <div class="contact-wrapper">
		        <form class="contact-form" action="${pageContext.request.contextPath}/About" method="POST">
		        <span style="text-align: center; color:red; width:100%;"><%=erMsg != null ? erMsg : ""%></span>
		        <%
		        if (userId == null) {
		        %>
		        	<div class="contact-form-group">
		                <label class="contact-label" for="contact-email">Email Address</label>
		                <input class="contact-input" type="email" id="contact-email" name="email" placeholder="abcd@gmail.com"/>
		            </div>
		        <%} %>
		            <div class="contact-form-group">
		                <label class="contact-label" for="contact-message">Message</label>
		                <textarea class="contact-input contact-textarea" id="contact-message" name="message" placeholder="Write your message here..."></textarea>
		            </div>
		            <button class="contact-submit-btn" type="submit">Send Message</button>
		        </form>
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