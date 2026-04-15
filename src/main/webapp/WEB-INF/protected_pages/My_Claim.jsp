<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My_Claim</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/My_claim.css">
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

    <nav class="tabs-cont">
        <div class="tabs">
            <a href="#" class="tab_act">My Claims</a>
            <a href="#" class="tab">Requested Claims</a>
        </div>
    </nav>

    <main class="container">
        <header1 class="page-header">
            <h1>My Claims</h1>
            <p>Track the journey of your found items. Our digital concierge ensures your belongings return home with
                grace and efficiency.</p>
        </header1>

        <section class="middle">
            <aside class="left-side">

                <div class="Active-request">
                    <h1>ACTIVE REQUESTS</h1>
                    <span>04</span>
                    <p>Your claims are currently being processed by our
                        curation team. Most items are verified within 24
                        hours.</p>
                </div>

                <div class="guideline">
                    <h1>Claim Guideline</h1>
                    <p>Provide high-resolution photos for verification.</p>
                    <p>Describe identifying marks or unique serial
                        numbers.</p>
                </div>
            </aside>

            <div class="right-side">

                <div class="claim-card">
                    <div class="image">
                        <img src="image/wallet.png" alt="wallet img">
                    </div>
                    <div class="item-details">
                        <h2>Browm Leather Small Bag</h2>
                        <h3>Accepted: Oct 24, 2023</h3>
                    </div>
                    <div class="Returned">
                        <h1>Returned</h1>
                        <a href="#" class="view-details">
                            View Item
                        </a>
                    </div>
                </div>

                <div class="claim-card">
                    <div class="image">
                        <img src="image/headphone.png" alt="headphone img">
                    </div>
                    <div class="item-details">
                        <h2>Black Sony Headphone</h2>
                        <h3>Accepted: Nov 12, 2023</h3>
                    </div>
                    <div class="Found">
                        <h1>Found</h1>
                        <a href="#" class="view-details">
                            View Item
                        </a>
                    </div>
                </div>

                <div class="claim-card">
                    <div class="image">
                        <img src="image/watch.png" alt="watch img">
                    </div>
                    <div class="item-details">
                        <h2>Silver Watch</h2>
                        <h3>Accepted: Nov 28, 2023</h3>
                    </div>
                    <div class="Found">
                        <h1>Found</h1>
                        <a href="#" class="view-details">
                            View Item
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <nav class="slide">
        <button class="page-btn"><</button>
                <button class="page-btn activate">1</button>
                <button class="page-btn">2</button>
                <button class="page-btn">3</button>
                <button class="page-btn">></button>
    </nav>

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