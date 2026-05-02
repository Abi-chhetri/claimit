<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width>, initial-scale=1.0">
    <title>FonudItem</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/found_item.css">
     <% String msg=(String) request.getAttribute("msg"); if (msg !=null) { %>
            <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/ReportFoundItem">
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
				<a href="${pageContext.request.contextPath}/Claims">Claims</a>
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
            <button class="noti-acc-button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24">
                    <path fill="currentColor"
                        d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6m0 14c-2.03 0-4.43-.82-6.14-2.88a9.95 9.95 0 0 1 12.28 0C16.43 19.18 14.03 20 12 20" />
                </svg></button>
        </div>
    </header>

    <main class="container">
            <%
		if (msg != null) {
		%>
		<div class="msg-box">
			<%=msg%>
		</div>
		<%
		}
		%>
        <header1 class="main-container">

            <aside class="sidebar">
                <h1>Report Found Item</h1>
                <p class="description">Help reunite someone with their lost property. Your detailed report acts as a
                    digital beacon for
                    the rightful owner.</p>

                <section class="content">
                    <div class="secure">
                        <strong>Secure Handling</strong>
                        <p>We verify claims through specific item
                            details only you and the owner would know.</p>
                    </div>
                    <div class="secure">
                        <strong>Location Privacy</strong>
                        <p>Exact street address are only shared once a claim is verified by our team</p>
                    </div>
                </section>

                <div class="image">
                    <img src="${pageContext.request.contextPath}/images/found_item.png" alt="lost item image">
                </div>
            </aside>

            <section class="right_side">
            
                <form method="post" action="${pageContext.request.contextPath}/ReportFoundItem"  enctype="multipart/form-data">
                    <h1 class="section-title">Item Details</h1>


                    <div class="form-group">
                        <label for="Item Name">Item Name</label>
                        <input type="text" id="item-name" name="item-name" placeholder="eg.Blue Leather Wallet"
                            required>
                    </div>
                    
                    <div class="form-group">
					    <label for="category">Category</label>
					    <select id="category" name="category" required>
					    	<option value="" disabled selected>Select a category</option>
					        <option value="ELECTRONICS">ELECTRONICS</option>
							<option value="ACCESSORIES">ACCESSORIES</option>
							<option value="BAGS">BAGS</option>
							<option value="KEYS">KEYS</option>
							<option value="DOCUMENTS">DOCUMENTS & ID</option>
							<option value="JEWELRY">JEWELRY</option>
							<option value="OTHER">OTHER</option>
					    </select>
					</div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" rows="4"
                            placeholder="Describe unique markings, brand, color, or condition..." required></textarea>
                    </div>

                    <h2 class="section-title">Time & Place</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="date-found">Date Found</label>
                            <input type="date" id="date-found" name="date-found" placeholder="mm/dd/yyyy" required>
                        </div>
                        <div class="form-group">
                            <label for="location">Location Found</label>
                            <input type="text" id="location" name="location_found"
                                placeholder="e.g Central Park West Entrance" required>
                        </div>
                    </div>
                    <h2 class="section-title">Media</h2>
					
					<div class="upload-area">
					    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24">
					        <path fill="#4A90D9" d="M19.35 10.04A7.49 7.49 0 0 0 12 4C9.11 4 6.6 5.64 5.35 8.04A5.994 5.994 0 0 0 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5c0-2.64-2.05-4.78-4.65-4.96M14 13v4h-4v-4H7l5-5l5 5z"/>
					    </svg>
					    <p><strong>Upload Image (Optional)</strong></p>
					    <p class="upload-sub">Max size: 100MB. PNG and JPEG only.</p>
					    <p class="upload-sub" id="file-info">No files selected</p> 
					    <label for="image-upload" class="browse-btn">Browse Files</label>
					    <input type="file" id="image-upload" name="item_image" accept="image/png, image/jpeg" multiple>
					</div>

                    <div class="button">
                        <button type="reset" class="cancel-btn">Clear</button>
                        <button type="submit" class="submit-btn">Submit Report</button>
                    </div>
                </form>
            </section>
        </header1>
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
    
    <script>
	    document.getElementById("image-upload").addEventListener("change", function() {
	        const fileInfo = document.getElementById("file-info");
	        const count = this.files.length;
	        if (count === 0) {
	            fileInfo.textContent = "No files selected";
	        } else if (count === 1) {
	            fileInfo.textContent = this.files[0].name;
	        } else {
	            fileInfo.textContent = count + " files selected";
	        }
	    });
	    
	    document.querySelector("form").addEventListener("reset", function() {
	        document.getElementById("file-info").textContent = "No files selected";
	    });
	</script>
</body>

</html>