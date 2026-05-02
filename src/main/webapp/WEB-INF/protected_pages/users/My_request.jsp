<%@page import="com.claimit.enums.ClaimStatus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.claimit.model.Claim, java.util.List, java.text.SimpleDateFormat" %>

<%List<Claim> claims= (List<Claim>) request.getAttribute("claims"); %>
<%
int returned=0;
int rejected=0;
int pending= 0;
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Requested Claim</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/My_request.css">
</head>

<body>


    <header class="header">
        <div class="header1">
            <span class="claimit-onheader">ClaimIt</span>
            <nav class="navbar">
                <a href="#">Home</a>
                <a href="#">Browse</a>
                <a href="#">Dashboard</a>
                <a href="#">Report</a>
                <a href="${pageContext.request.contextPath}/MyRequestedClaim">Claims</a>
                <a href="#">About</a>
            </nav>
        </div>
        <div class="header2">
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
    <nav class="tabs-cont">
        <div class="tabs">
            <a href="${pageContext.request.contextPath}/MyClaim" class="tab">My Claims</a>
            <a href="${pageContext.request.contextPath}/MyRequestedClaim" class="tab_act">Requested Claims</a>
        </div>
    </nav>

    <main class="container">
        <header1 class="page-header">
            <h1>My Requested Claims</h1>
            <p>Monitor the progress of your lost item inquiries. Our concierge team is<br>
                currently verifying these ownership requests</p>
        </header1>
        <div class="content-grid">
            <section class="content">
            <%if(claims.isEmpty() || claims == null){ %>
            <h1>You have not requested any claim yet to show.</h1>
            <%}else{ %>
	            <%for (Claim eachClaim: claims){
	            	if(eachClaim.getClaimStatus().equals(ClaimStatus.PENDING.name())){
	            		pending++;
	            	%>
	                <article class="claim-card">
	                    <div class="image">
	                        <img src="<%=eachClaim.getProofImage()%>" alt="wallet image">
	                    </div>
	
	                    <div class="claim-content">
	                        <div class="status"><%=eachClaim.getClaimStatus() %> Verification</div>
	
	                        <div class="claim-date">
	                            <h5>CLAIMED ON</h5>
	                            <span><%= new SimpleDateFormat("MMM dd, yyyy").format(eachClaim.getCreatedAt()) %></span>
	                        </div>
	
	                        <h2><%=eachClaim.getItemTitle() %></h2>
	                        <p class="pending">Category : <%=eachClaim.getItemCategory().substring(0,1) + eachClaim.getItemCategory().toLowerCase().substring(1) %></p>
	                        <p class="pending">Ownership Description : <%=eachClaim.getOwnershipDescription() %></p>
	                        <p class="pending">Admin Notes : <%=eachClaim.getAdminNotes() == null ? "No Message Yet.":eachClaim.getAdminNotes() %></p>
	                    </div>
	                </article>
	                <%} else if(eachClaim.getClaimStatus().equals(ClaimStatus.APPROVED.name())){
	                	returned++;
	                }
	                else if( eachClaim.getClaimStatus().equals(ClaimStatus.REJECTED.name()) ){
	                	rejected++;
	                }
	                %>
	            <%} %>
            <%} %>
            </section>

            <aside class="summary-sidebar">
                <div class="summary-card">
                    <h3>Claim Summary</h3>

                    <div class="summary-stats">
                        <div class="stat">
                            <span class="label">Total Claims</span>
                            <span class="value"><%=claims.size() %></span>
                        </div>
                        <div class="stat">
                            <span class="pending">Currently Pending</span>
                            <span class="pen-value"><%=pending %></span>
                        </div>
                        <div class="stat">
                            <span class="completed">Successfully Returned</span>
                            <span class="comp-value"><%= returned %></span>
                        </div>
                        <div class="stat">
                            <span class="rejected">Total Rejected</span>
                            <span class="rej-value"><%= rejected %></span>
                        </div>
                    </div>

                    <div class="info-box">
                        <p>Most claims are verified within 24-48 business hours.</p>
                    </div>
                </div>
            </aside>
        </div>
    </main>
</body>
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

</html>