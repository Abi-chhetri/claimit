<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LostItem</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lost_item.css">
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
                <a href="#">Claims</a>
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

    <main class="main-container">
        <article class="container">

            <nav class="tabs-cont">
                <div class="tabs">
                    <a href="../found/found_item.html" class="tab">Report Found Item</a>
                    <a href="#" class="tab_act">Report Lost Item</a>
                </div>
            </nav>

            <header class="header1">
                <h1>Report Lost Item</h1>
                <p>Provide as many details as possible. Our concierge system uses editorial <br>
                    functionalism to match your lost belongings with reported found items.</p>
            </header>

            <section class="middle">
                <section class="form_section">
                    <form method="post" action="${contextPage.request.contextPath}">
                        <div class="form-group">
                            <label for="item-name">Item Name</label>
                            <input type="text" id="item-name" name="item-name" placeholder="eg.Vintage Leather Wallet"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="date-lost">Date Lost</label>
                            <input type="date" id="date-lost" name="date-lost" placeholder="mm/dd/yyyy" required>
                        </div>

                        <div class="form-group">
                            <label for="location">Location Lost</label>
                            <input type="text" id="location" name="location_lost"
                                placeholder="Last known location or area" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea id="description" name="description" rows="4"
                                placeholder="Mention specific identifiers, colors, or contents..." required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="image-upload">Upload Image (Optional)</label>
                            <div class="upload-area">
                                <p>Click to upload or drag and drop</p>
                                <small>PNG, JPEG, up to 10MB</small>
                                <input type="file" id="image-upload" name="item_image" accept="image/png, image/jpeg"
                                    hidden>
                            </div>
                        </div>

                        <div class="buttons">
                            <button type="submit" class="submit-btn">SUBMIT REPORT</button>
                            <button type="button" class="cancel-btn">Cancel</button>
                        </div>
                    </form>
                </section>

                <aside class="sidebar">
                    <aside class="image">
                        <img src="image/lost.png" alt="lost item ">
                    </aside>

                    <section class="tips-section">
                        <h3>Submission Tips</h3>

                        <div class="tip">
                            <div class="tip-item">
                                <span class="tip-number">01</span>
                                <p>Be specific about unique marks (scratches, stickers, or engravings).</p>
                            </div>

                            <div class="tip-item">
                                <span class="tip-number">02</span>
                                <p>Providing a clear photo increases recovery chances by up to 60%.</p>
                            </div>

                            <div class="tip-item">
                                <span class="tip-number">03</span>
                                <p>Check our Live Map after submitting to see nearby finds.</p>
                            </div>
                        </div>
                    </section>

                    <div class="privacy-note">
                        <strong>Privacy Note:</strong>Your personal information is only shred with verified claim
                        handlers.
                        Ensure you do not include sensitive data like passwords or full card numbers in the description.
                    </div>
                </aside>
            </section>
        </article>
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