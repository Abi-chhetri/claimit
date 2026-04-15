<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClaimIt - Notifications</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Notifications.css">
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
                <svg class="Active" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
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
    <main class="main-page">
        <section class="notifications-header">
            <div class="notifications-title-group">
                <p class="notifications-label">UPDATES</p>
                <h1 class="notifications-title">Notifications</h1>
                <p class="notifications-subtitle">Stay updated on your reported items and community matches.</p>
            </div>
            <button class="mark-all-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                    <path
                        d="M18 7l-1.41-1.41-6.34 6.34 1.41 1.41L18 7zm4.24-1.41L11.66 16.17 7.48 12l-1.41 1.41L11.66 19l12-12-1.42-1.41zM.41 13.41L6 19l1.41-1.41L1.83 12 .41 13.41z" />
                </svg>
                Mark all as read
            </button>
        </section>
        <section class="notifications-layout">
            <aside class="notifications-sidebar">
                <div class="filter-buttons-wrapper">
                    <p class="filter-label">FILTER BY</p>
                    <div class="filter-buttons">
                        <button class="filter-btn active-filter">All <span
                                class="filter-count active-count">12</span></button>
                        <button class="filter-btn">Matches <span class="filter-count">3</span></button>
                        <button class="filter-btn">Status Updates <span class="filter-count">8</span></button>
                    </div>
                </div>
                <div class="claim-success-card">
                    <div class="claim-success-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="#FFFFFF">
                            <path
                                d="M11 18h2v-2h-2v2zm1-16C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm0-14c-2.21 0-4 1.79-4 4h2c0-1.1.9-2 2-2s2 .9 2 2c0 2-3 1.75-3 5h2c0-2.25 3-2.5 3-5 0-2.21-1.79-4-4-4z" />
                        </svg>
                    </div>
                    <h3 class="claim-success-title">Claim Success!</h3>
                    <p class="claim-success-desc">Did you get your item back? Your feedback helps the community grow
                        stronger.</p>
                </div>
            </aside>
            <article class="notifications-content">

                <time class="day-label">TODAY</time>

                <article class="notification-item">
                    <div class="notif-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                            fill="#414754">
                            <path
                                d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" />
                        </svg>
                    </div>
                    <div class="notif-body">
                        <h3 class="notif-title">Item Status Update</h3>
                        <p class="notif-desc">The "Brown Leather Wallet" you reported has been officially verified by
                            the center management.</p>
                        <p class="notif-time">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24"
                                fill="#414754">
                                <path
                                    d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z" />
                            </svg>
                            3 hours ago
                        </p>
                    </div>
                    <span class="notif-tag status">Status</span>
                </article>

                <article class="notification-item">
                    <div class="notif-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                            fill="#414754">
                            <path
                                d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
                        </svg>
                    </div>
                    <div class="notif-body">
                        <h3 class="notif-title">New Found Item Nearby</h3>
                        <p class="notif-desc">A pair of "Ray-Ban Sunglasses" was found within 2km of your last active
                            location.</p>
                        <p class="notif-time">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24"
                                fill="#414754">
                                <path
                                    d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z" />
                            </svg>
                            6 hours ago
                        </p>
                    </div>
                    <span class="notif-tag alert">Alert</span>
                </article>

                <time class="day-label">YESTERDAY</time>

                <article class="notification-item">
                    <div class="notif-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                            fill="#414754">
                            <path
                                d="M12 2L3 7v5c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5zm-1 13l-3-3 1.41-1.41L11 12.17l4.59-4.58L17 9l-6 6z" />
                        </svg>
                    </div>
                    <div class="notif-body">
                        <h3 class="notif-title">Email Verified</h3>
                        <p class="notif-desc">Thank you for verifying your email address. You are now eligible to claim
                            high-value items.</p>
                        <p class="notif-time">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24"
                                fill="#888">
                                <path
                                    d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z" />
                            </svg>
                            1 day ago
                        </p>
                    </div>
                    <span class="notif-tag system">System</span>
                </article>

                <button class="view-older-btn">View older notifications</button>

            </article>
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