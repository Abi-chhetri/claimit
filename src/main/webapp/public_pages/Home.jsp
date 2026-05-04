<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClaimIt - Home</title>
    <link rel="stylesheet" href="HomePage.css">
</head>

<body>
    <header class="header">
        <div class="header1">
            <span class="claimit-onheader">ClaimIt</span>
            <nav class="navbar">
                <a href="#" class="Active">Home</a>
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
    <main class="main-content">

        <section class="hero-section">
            <div class="hero-left">
                <span class="hero-tag">THE DIGITAL CONCIERGE</span>
                <h1 class="hero-heading">
                    Lost Something?<br>
                    <span class="hero-heading-blue">Found Something?</span>
                </h1>
                <p class="hero-subtitle">ClaimIt bridges the gap between misplaced belongings and their owners through
                    elegant, effortless recovery.<br>Experience the high-end standard for lost and found.</p>
                <div class="hero-buttons">
                    <button class="btn-primary">Report Lost Item</button>
                    <button class="btn-secondary">Found an Item</button>
                </div>
            </div>
            <div class="hero-right">
                <div class="hero-image-wrapper">
                    <div class="hero-image-placeholder"></div>
                    <div class="hero-image-label">
                        <span class="hero-label-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path fill="#00722F"
                                    d="M23 11.99L20.56 9.2l.34-3.69l-3.61-.82L15.4 1.5L12 2.96L8.6 1.5L6.71 4.69L3.1 5.5l.34 3.7L1 11.99l2.44 2.79l-.34 3.7l3.61.82l1.89 3.2l3.4-1.47l3.4 1.46l1.89-3.19l3.61-.82l-.34-3.69zm-3.95 1.48l-.56.65l.08.85l.18 1.95l-1.9.43l-.84.19l-.44.74l-.99 1.68l-1.78-.77l-.8-.34l-.79.34l-1.78.77l-.99-1.67l-.44-.74l-.84-.19l-1.9-.43l.18-1.96l.08-.85l-.56-.65L3.67 12l1.29-1.48l.56-.65l-.09-.86l-.18-1.94l1.9-.43l.84-.19l.44-.74l.99-1.68l1.78.77l.8.34l.79-.34l1.78-.77l.99 1.68l.44.74l.84.19l1.9.43l-.18 1.95l-.08.85l.56.65l1.29 1.47z" />
                                <path fill="#00722F"
                                    d="m10.09 13.75l-2.32-2.33l-1.48 1.49l3.8 3.81l7.34-7.36l-1.48-1.49z" />
                            </svg>
                        </span>
                        <div class="hero-label-text">
                            <span class="hero-label-title">RECENT LOST ITEM</span>
                            <span class="hero-label-name">XYZ</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <main class="main-content2">
        <section class="hiw-section">
            <div class="hiw-header">
                <h2 class="hiw-title">How It Works</h2>
                <p class="hiw-subtitle">Three simple steps to reconnect you with your belongings.</p>
            </div>
            <div class="hiw-cards">

                <article class="hiw-card">
                    <div class="hiw-icon-box hiw-icon-purple">
                        <img class="hiw-png" src="hiw1.png" width="48" height="48" alt="Report" />
                    </div>
                    <h3 class="hiw-step-title">1. Report</h3>
                    <p class="hiw-step-desc">Log the details of what you've lost or found. High-quality photos and
                        precise locations help our concierge engine work faster.</p>
                    <span class="hiw-step-number">01</span>
                </article>

                <article class="hiw-card">
                    <div class="hiw-icon-box hiw-icon-green">
                        <img class="hiw-png" src="hiw2.png" width="48" height="48" alt="Report" />
                    </div>
                    <h3 class="hiw-step-title">2. Browse</h3>
                    <p class="hiw-step-desc">Our intelligent algorithm scans reported items in real-time, matching
                        descriptions and geographical metadata to find likely pairs.</p>
                    <span class="hiw-step-number">02</span>
                </article>

                <article class="hiw-card">
                    <div class="hiw-icon-box hiw-icon-yellow">
                        <img class="hiw-png" src="hiw3.png" width="48" height="48" alt="Report" />
                    </div>
                    <h3 class="hiw-step-title">3. Claim</h3>
                    <p class="hiw-step-desc">Once a match is identified, follow our secure verification process to
                        confirm ownership and coordinate a safe return.</p>
                    <span class="hiw-step-number">03</span>
                </article>

            </div>
        </section>
    </main>
    <main class="main-content3">
        <section class="impact-section">
            <div class="impact-left">
                <h2 class="impact-title">Impact in Numbers</h2>
                <p class="impact-desc">Every returned item tells a story of relief and community spirit. Join the
                    thousands who trust ClaimIt.</p>
            </div>
            <div class="impact-right">
                <div class="impact-stat">
                    <span class="impact-number impact-blue">14.2k+</span>
                    <span class="impact-label">ITEMS REPORTED</span>
                </div>
                <div class="impact-stat">
                    <span class="impact-number impact-green">8.9k+</span>
                    <span class="impact-label">ITEMS RETURNED</span>
                </div>
            </div>
        </section>
    </main>
    <footer class="big-footer">
        <div class="big-footer-top">
            <div class="big-footer-brand">
                <span class="big-footer-logo">ClaimIt</span>
                <p class="big-footer-desc">The world's most trusted lost and found platform. Built on the principles of
                    trust, transparency, and rapid recovery.</p>
                <div class="big-footer-icons">
                    <button class="big-footer-icon-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                            fill="#475569">
                            <path
                                d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92s2.92-1.31 2.92-2.92-1.31-2.92-2.92-2.92z" />
                        </svg>
                    </button>
                    <button class="big-footer-icon-btn">
                        <img class="earth-png" src="earth.png" width="18" height="18" alt="Report" />
                    </button>
                </div>
            </div>

            <div class="big-footer-col">
                <h4 class="big-footer-col-title">Explore</h4>
                <a href="#">Find Items</a>
                <a href="#">Recent Matches</a>
                <a href="#">Success Stories</a>
                <a href="#">Locations</a>
            </div>

            <div class="big-footer-col">
                <h4 class="big-footer-col-title">Company</h4>
                <a href="#">Blog</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
                <a href="#">About Us</a>
            </div>
        </div>
    </footer>
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