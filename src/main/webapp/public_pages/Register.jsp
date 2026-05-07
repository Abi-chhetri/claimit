<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClaimIt - Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Register.css">
</head>
<body>
    <header class="site-header">
        <span class="brand-name">ClaimIt</span>
        <nav class="desktop-nav">
            <a href="${pageContext.request.contextPath}/Home">Home</a>
            <a href="${pageContext.request.contextPath}/About">About</a>
            <a href="${pageContext.request.contextPath}/Login">Login</a>
            <a href="${pageContext.request.contextPath}/Register" class="active">Registration</a>
        </nav>
    </header>

    <main class="register-page">
        <section class="register-card">
            <div class="card-brand">
                <c:if test="${not empty msg}">
                    <p style="color: red; text-align: center; margin-bottom:10px;">${msg}</p>
                </c:if>
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="ClaimIt logo" class="brand-logo" />
                <span class="card-brand-name">ClaimIt</span>
                <span class="card-brand-subtitle">Digital Concierge for Lost &amp; Found</span>
            </div>
            <h1>Create your portal account</h1>
            <p class="register-subtitle">Join the network to track your items and receive instant recovery alerts.</p>

            <form class="register-form" method="POST">

                <div class="field-group">
                    <label for="full-name">Full Name <span style="color:red;">*</span></label>
                    <div class="input-wrapper">
                        <input type="text" id="full-name" name="full_name" placeholder="Full Name" autocomplete="name" />
                    </div>
                </div>

                <div class="field-group">
                    <label for="email">Email <span style="color:red;">*</span></label>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email" placeholder="abcd123@gmail.com" autocomplete="email" />
                    </div>
                </div>

                <div class="field-group">
                    <label for="phone">Phone Number</label>
                    <div class="input-wrapper">
                        <input type="tel" id="phone" name="phone" placeholder="(+977) 9808085274" autocomplete="tel" />
                    </div>
                </div>

                <div class="password-row">
                    <div class="field-group">
                        <label for="password">Password <span style="color:red;">*</span></label>
                        <div class="input-wrapper">
                            <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="new-password" />
                        </div>
                    </div>
                    <div class="field-group">
                        <label for="confirm-password">Confirm Password <span style="color:red;">*</span></label>
                        <div class="input-wrapper">
                            <input type="password" id="confirm-password" name="confirm_password" placeholder="••••••••" autocomplete="new-password" />
                        </div>
                    </div>
                </div>

                <div class="terms-group">
                    <input type="checkbox" id="terms" name="terms"/>
                    <label for="terms"><span style="color:red;">*</span> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a> regarding item tracking.</label>
                </div>

                <button class="submit-btn" type="submit">Create Account &#8594;</button>

            </form>

            <p class="login-link">Already have an account? <a href="${pageContext.request.contextPath}/Login">Login</a></p>

        </section>
    </main>

    <footer class="site-footer">
        <p>&copy; 2026 CLAIMIT SECURITY SYSTEMS &bull; SECURED GATEWAY</p>
    </footer>

</body>
</html>