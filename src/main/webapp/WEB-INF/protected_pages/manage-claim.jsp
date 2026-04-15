<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-dashboard-nav.css">
    <link rel="stylesheet" href="manage-claim.css">
</head>

<body>
    <aside>
        <section class="admin-aside-outer">
            <div class="admin-aside-claimit-console">
                <p class="claimit-admin-console">ClaimIt Admin Console</p>
                <p class="management-dashboard">Management Dashboard</p>
            </div>

            <div class="admin-aside-admin-function-outer">

                <div class="admin-aside-admin-function">
                    <a href="admin-dashboard.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569"
                                d="M13 9V3h8v6zM3 13V3h8v10zm10 8V11h8v10zM3 21v-6h8v6zm2-10h4V5H5zm10 8h4v-6h-4zm0-12h4V5h-4zM5 19h4v-2H5zm4-2" />
                        </svg>
                        <p class="admin-function-name">Dashboard</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-item.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M20 21h-8a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2m-8-4v2h8v-2Z" />
                            <path fill="#475569"
                                d="M28 4H4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2v16a2 2 0 0 0 2 2h20a2 2 0 0 0 2-2V12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2m-2 24H6V12h20Zm2-18H4V6h24z" />
                        </svg>
                        <p class="admin-function-name">Manage Items</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-claim.html" class="admin-functions active-nav">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#1D4ED8" fill-rule="evenodd"
                                d="M20 4H4a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1M4 2a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h16a3 3 0 0 0 3-3V5a3 3 0 0 0-3-3zm2 5h2v2H6zm5 0a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2zm-3 4H6v2h2zm2 1a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2h-6a1 1 0 0 1-1-1m-2 3H6v2h2zm2 1a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2h-6a1 1 0 0 1-1-1"
                                clip-rule="evenodd" />
                        </svg>
                        <p class="admin-function-name">Manage Claims</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-report.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="16" viewBox="0 0 16 16">
                            <rect width="16" height="16" fill="none" />
                            <path fill="#475569"
                                d="M0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0 1 14.25 13H8.06l-2.573 2.573A1.458 1.458 0 0 1 3 14.543V13H1.75A1.75 1.75 0 0 1 0 11.25Zm1.75-.25a.25.25 0 0 0-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 0 1 .75.75v2.19l2.72-2.72a.75.75 0 0 1 .53-.22h6.5a.25.25 0 0 0 .25-.25v-9.5a.25.25 0 0 0-.25-.25Zm7 2.25v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0M9 9a1 1 0 1 1-2 0a1 1 0 0 1 2 0" />
                        </svg>
                        <p class="admin-function-name">Manage Reports</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-user.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="21" viewBox="0 0 21 21">
                            <rect width="21" height="21" fill="none" />
                            <g fill="none" fill-rule="evenodd" stroke="#000" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="1">
                                <path
                                    d="M8.5 2.5a3 3 0 0 1 3 3v2a3 3 0 1 1-6 0v-2a3 3 0 0 1 3-3m7 14v-.728c0-3.187-3.686-5.272-7-5.272s-7 2.085-7 5.272v.728a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1" />
                                <path fill="#475569"
                                    d="M12.52 2.678A3 3 0 0 1 14.5 5.5v1c0 1.297-.848 2.581-2 3q1.01-1.379 1.01-3.5c0-2.122-.331-2.523-.99-3.322M17.5 17.5h1a1 1 0 0 0 1-1v-.728c0-2.17-1.71-3.83-3.847-4.667c0 0 2.847 2.395 1.847 6.395" />
                            </g>
                        </svg>
                        <p class="admin-function-name">Manage Users</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="manage-moderators.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 8 8">
                            <rect width="8" height="8" fill="none" />
                            <path fill="#475569" d="M4 4v3q2 0 3-3M4 4V1L1 2v2m3-4l4 2c0 8-8 8-8 0" />
                        </svg>
                        <p class="admin-function-name">Manage Moderators</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="contact-message.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32">
                            <rect width="32" height="32" fill="none" />
                            <path fill="#475569"
                                d="M2.004 9.303A4.5 4.5 0 0 1 6.5 5h19a4.5 4.5 0 0 1 4.496 4.303l-1.476.82L16 16.864L3.48 10.123zM2 11.588V22.5A4.5 4.5 0 0 0 6.5 27h19a4.5 4.5 0 0 0 4.5-4.5V11.588l-.526.293l-13 7a1 1 0 0 1-.948 0L2.514 11.874z" />
                        </svg>
                        <p class="admin-function-name">Contact Messages</p>
                    </a>
                </div>

                <div class="admin-aside-admin-function">
                    <a href="admin-logs.html" class="admin-functions">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <path fill="#475569"
                                d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12h2a8 8 0 1 0 1.385-4.5H8v2H2v-6h2V6a9.99 9.99 0 0 1 8-4m1 5v4.585l3.243 3.243l-1.415 1.415L11 12.413V7z" />
                        </svg>
                        <p class="admin-function-name">Admin Logs</p>
                    </a>
                </div>

            </div>

            <div class="admin-aside-admin-logout">
                <div id="admin-logo">
                    <a href="#" class="admin-logo">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <rect width="24" height="24" fill="none" />
                            <g fill="#475569">
                                <path
                                    d="M6.5 3.75c-.526 0-1.25.63-1.25 1.821V18.43c0 1.192.724 1.821 1.25 1.821h6.996a.75.75 0 1 1 0 1.5H6.5c-1.683 0-2.75-1.673-2.75-3.321V5.57c0-1.648 1.067-3.321 2.75-3.321h7a.75.75 0 0 1 0 1.5z" />
                                <path
                                    d="M16.53 7.97a.75.75 0 0 0-1.06 0v3.276H9.5a.75.75 0 0 0 0 1.5h5.97v3.284a.75.75 0 0 0 1.06 0l3.5-3.5a.75.75 0 0 0 .22-.532v-.002a.75.75 0 0 0-.269-.575z" />
                            </g>
                        </svg>
                        <p class="admin-dash-logout-txt">Logout</p>
                    </a>
                </div>

                <div id="admin-logo">
                    <a href="#" class="admin-user-system-outer">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 36 36">
                            <rect width="36" height="36" fill="none" />
                            <path fill="#475569"
                                d="M14.68 14.81a6.76 6.76 0 1 1 6.76-6.75a6.77 6.77 0 0 1-6.76 6.75m0-11.51a4.76 4.76 0 1 0 4.76 4.76a4.76 4.76 0 0 0-4.76-4.76"
                                class="clr-i-outline clr-i-outline-path-1" />
                            <path fill="#475569"
                                d="M16.42 31.68A2.14 2.14 0 0 1 15.8 30H4v-5.78a14.8 14.8 0 0 1 11.09-4.68h.72a2.2 2.2 0 0 1 .62-1.85l.12-.11c-.47 0-1-.06-1.46-.06A16.47 16.47 0 0 0 2.2 23.26a1 1 0 0 0-.2.6V30a2 2 0 0 0 2 2h12.7Z"
                                class="clr-i-outline clr-i-outline-path-2" />
                            <path fill="#475569" d="M26.87 16.29a.4.4 0 0 1 .15 0a.4.4 0 0 0-.15 0"
                                class="clr-i-outline clr-i-outline-path-3" />
                            <path fill="#475569"
                                d="m33.68 23.32l-2-.61a7.2 7.2 0 0 0-.58-1.41l1-1.86A.38.38 0 0 0 32 19l-1.45-1.45a.36.36 0 0 0-.44-.07l-1.84 1a7 7 0 0 0-1.43-.61l-.61-2a.36.36 0 0 0-.36-.24h-2.05a.36.36 0 0 0-.35.26l-.61 2a7 7 0 0 0-1.44.6l-1.82-1a.35.35 0 0 0-.43.07L17.69 19a.38.38 0 0 0-.06.44l1 1.82a6.8 6.8 0 0 0-.63 1.43l-2 .6a.36.36 0 0 0-.26.35v2.05A.35.35 0 0 0 16 26l2 .61a7 7 0 0 0 .6 1.41l-1 1.91a.36.36 0 0 0 .06.43l1.45 1.45a.38.38 0 0 0 .44.07l1.87-1a7 7 0 0 0 1.4.57l.6 2a.38.38 0 0 0 .35.26h2.05a.37.37 0 0 0 .35-.26l.61-2.05a7 7 0 0 0 1.38-.57l1.89 1a.36.36 0 0 0 .43-.07L32 30.4a.35.35 0 0 0 0-.4l-1-1.88a7 7 0 0 0 .58-1.39l2-.61a.36.36 0 0 0 .26-.35v-2.1a.36.36 0 0 0-.16-.35M24.85 28a3.34 3.34 0 1 1 3.33-3.33A3.34 3.34 0 0 1 24.85 28"
                                class="clr-i-outline clr-i-outline-path-4" />
                            <path fill="none" d="M0 0h36v36H0z" />
                        </svg>
                        <span class="admin-user-system">
                            <p class="admin-user">Admin User</p>
                            <p class="system-oversight">System Oversight</p>
                        </span>
                    </a>
                </div>
            </div>

        </section>
    </aside>

    <article class="main-footer">
        <main>
            <section class="admin-main-outer">

                <!-- Page Header -->
                <div class="mc-header">
                    <div>
                        <h1 class="mc-title">Manage Claims</h1>
                        <p class="mc-subtitle">Review and process ownership claims for recovered items.</p>
                    </div>
                    <div class="mc-avatars">
                        <a href="" class="admin-dashboard-admin-logo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 16 16">
                                <rect width="16" height="16" fill="none" />
                                <path fill="#000" d="M11 7c0 1.66-1.34 3-3 3S5 8.66 5 7s1.34-3 3-3s3 1.34 3 3" />
                                <path fill="#000" fill-rule="evenodd"
                                    d="M16 8c0 4.42-3.58 8-8 8s-8-3.58-8-8s3.58-8 8-8s8 3.58 8 8M4 13.75C4.16 13.484 5.71 11 7.99 11c2.27 0 3.83 2.49 3.99 2.75A6.98 6.98 0 0 0 14.99 8c0-3.87-3.13-7-7-7s-7 3.13-7 7c0 2.38 1.19 4.49 3.01 5.75"
                                    clip-rule="evenodd" />
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Filter Bar -->
                <div class="mc-filter-bar">
                    <div class="mc-search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none"
                            stroke="#94A3B8" stroke-width="2">
                            <circle cx="11" cy="11" r="8" />
                            <line x1="21" y1="21" x2="16.65" y2="16.65" />
                        </svg>
                        <input type="text" placeholder="Search by Claim ID or Item..." />
                    </div>
                    <div class="mc-filter-pill">
                        <select>
                            <option>Status: All</option>
                            <option>Pending</option>
                            <option>In Review</option>
                            <option>Returned</option>
                        </select>
                    </div>
                    <div class="mc-filter-pill">
                        <select>
                            <option>Date: Last 30 Days</option>
                            <option>Last 7 Days</option>
                            <option>Last 90 Days</option>
                            <option>All Time</option>
                        </select>
                    </div>
                    <button class="mc-adv-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2">
                            <line x1="4" y1="6" x2="20" y2="6" />
                            <line x1="8" y1="12" x2="20" y2="12" />
                            <line x1="12" y1="18" x2="20" y2="18" />
                        </svg>
                        Advanced Filters
                    </button>
                </div>

                <!-- Claims Table -->
                <div class="mc-table-wrap">
                    <table class="mc-table">
                        <thead>
                            <tr>
                                <th>CLAIM ID</th>
                                <th>ITEM NAME</th>
                                <th>CLAIMED BY</th>
                                <th>DATE SUBMITTED</th>
                                <th>STATUS</th>
                                <th>ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody class="mc-tr">
                            <tr>
                                <td><a href="#" class="mc-claim-id">#CLM-8921</a></td>
                                <td>
                                    <div class="mc-item-info">
                                        <div class="mc-item-thumb">👜</div>
                                        <div>
                                            <p class="mc-item-name">Designer Leather Bag</p>
                                            <p class="mc-item-brand">Brown / Gucci</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mc-claimant-name">Eleanor Shellstrop</p>
                                    <p class="mc-claimant-email">eleanor.s@gmail.com</p>
                                </td>
                                <td>
                                    <p class="mc-date">Oct 24, 2023</p>
                                </td>
                                <td><span class="mc-badge pending">PENDING</span></td>
                                <td>
                                    <div class="mc-actions">
                                        <button class="mc-btn">Reject</button>
                                        <button class="mc-btn">Approve</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><a href="#" class="mc-claim-id">#CLM-8922</a></td>
                                <td>
                                    <div class="mc-item-info">
                                        <div class="mc-item-thumb">⌚</div>
                                        <div>
                                            <p class="mc-item-name">Smart Watch Series 7</p>
                                            <p class="mc-item-brand">Silver / Apple</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mc-claimant-name">Tahani Al-Jamil</p>
                                    <p class="mc-claimant-email">tahani.aj@gmail.com</p>
                                </td>
                                <td>
                                    <p class="mc-date">Oct 23, 2023</p>
                                </td>
                                <td><span class="mc-badge review">IN REVIEW</span></td>
                                <td>
                                    <div class="mc-actions">
                                        <button class="mc-btn">Reject</button>
                                        <button class="mc-btn">Approve</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><a href="#" class="mc-claim-id">#CLM-8923</a></td>
                                <td>
                                    <div class="mc-item-info">
                                        <div class="mc-item-thumb">🎧</div>
                                        <div>
                                            <p class="mc-item-name">Bose Headphones</p>
                                            <p class="mc-item-brand">Black / QC45</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mc-claimant-name">Chidi Anagonye</p>
                                    <p class="mc-claimant-email">chidi.a@email.com</p>
                                </td>
                                <td>
                                    <p class="mc-date">Oct 22, 2023</p>
                                </td>
                                <td><span class="mc-badge returned">RETURNED</span></td>
                                <td>
                                    <div class="mc-actions">
                                        <button class="mc-btn">Reject</button>
                                        <button class="mc-btn">Approve</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><a href="#" class="mc-claim-id">#CLM-8924</a></td>
                                <td>
                                    <div class="mc-item-info">
                                        <div class="mc-item-thumb">👛</div>
                                        <div>
                                            <p class="mc-item-name">Leather Wallet</p>
                                            <p class="mc-item-brand">Dark Brown / Fossil</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mc-claimant-name">Jason Mendoza</p>
                                    <p class="mc-claimant-email">jason.m@email.com</p>
                                </td>
                                <td>
                                    <p class="mc-date">Oct 22, 2023</p>
                                </td>
                                <td><span class="mc-badge pending">PENDING</span></td>
                                <td>
                                    <div class="mc-actions">
                                        <button class="mc-btn">Reject</button>
                                        <button class="mc-btn">Approve</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Pagination -->
                    <div class="mc-pagination-row">
                        <span>Showing 1 to 4 of 128 claims</span>
                        <div class="mc-pages">
                            <button class="mc-page-btn">&#8249;</button>
                            <button class="mc-page-btn active">1</button>
                            <button class="mc-page-btn">2</button>
                            <button class="mc-page-btn">3</button>
                            <span class="mc-page-dots">...</span>
                            <button class="mc-page-btn">12</button>
                            <button class="mc-page-btn">&#8250;</button>
                        </div>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="mc-stats-row">
                    <div class="mc-stat-blue">
                        <p class="mc-stat-blue-label">Total Active Claims</p>
                        <p class="mc-stat-blue-value">1,402</p>
                        <p class="mc-stat-blue-note">&#8599; +13% from last month</p>
                        <div class="mc-mini-bars">
                            <div class="mc-mini-bar" style="height:35%;"></div>
                            <div class="mc-mini-bar" style="height:50%;"></div>
                            <div class="mc-mini-bar" style="height:40%;"></div>
                            <div class="mc-mini-bar" style="height:65%;"></div>
                            <div class="mc-mini-bar" style="height:55%;"></div>
                            <div class="mc-mini-bar" style="height:80%;"></div>
                            <div class="mc-mini-bar" style="height:60%;"></div>
                            <div class="mc-mini-bar" style="height:90%;"></div>
                            <div class="mc-mini-bar" style="height:75%;"></div>
                            <div class="mc-mini-bar" style="height:100%;"></div>
                        </div>
                    </div>
                    <div class="mc-stat-white">
                        <p class="mc-stat-white-label">Resolved Today</p>
                        <p class="mc-stat-white-value">38</p>
                        <p class="mc-progress-label">76% of daily goal reached</p>
                        <div class="mc-progress-bar">
                            <div class="mc-progress-fill"></div>
                        </div>
                    </div>
                </div>

            </section>
        </main>

        <footer class="admin-dash-nav">
            <div class="footer-left">
                <p class="footer-brand">ClaimIt Admin Console</p>
                <p class="footer-copy">© 2024 ClaimIt Digital Concierge. All rights reserved.</p>
            </div>
            <div class="footer-links">
                <a href="privacy-policy.html">Privacy Policy</a>
                <a href="term-of-service.html">Terms of Service</a>
                <a href="security-audit.html">Security Audit</a>
                <a href="Support.html">Support</a>
            </div>
        </footer>
    </article>

</body>

</html>