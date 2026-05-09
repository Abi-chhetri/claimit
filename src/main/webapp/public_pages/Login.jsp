<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <c:if test="${not empty msg}">
        <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/Login">
    </c:if>
</head>

<body>
    <header class="Desktop_header">
        <div class="logo">ClaimIt</div>
        <nav>
            <a href="${pageContext.request.contextPath}/Home">Home</a>
            <a href="${pageContext.request.contextPath}/About">About</a>
            <a href="${pageContext.request.contextPath}/Login" class="active">Login</a>
            <a href="${pageContext.request.contextPath}/Register">Registration</a>
        </nav>
    </header>

    <header class="mobile_header">
        <img src="${pageContext.request.contextPath}/images/logo.jpeg" alt="logo" class="mobile-logo">
        <h2>ClaimIt</h2>
        <p class="portal">Digital Concierge Portal</p>
    </header>

    <c:if test="${not empty msg}">
        <div class="msg-box">
            ${msg}
        </div>
    </c:if>

    <section class="container">
        <aside class="image">
            <img src="${pageContext.request.contextPath}/images/left.png" alt="logo">
        </aside>

        <aside class="right">
            <div class="login-box">
                <div class="form-header">
                    <img src="${pageContext.request.contextPath}/images/logo.jpeg" alt="ClaimIt Logo" class="form-logo">
                    <h2>ClaimIt</h2>
                </div>

                <h1>Welcome back</h1>
                <p class="subtitle">Enter your credentials to access the portal</p>

                <c:if test="${not empty requestScope['error msg']}">
                    <p style="color: red; text-align: center; margin-bottom:10px;">
                        ${requestScope['error msg']}
                    </p>
                </c:if>

                <form method="POST">
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="password">
                    </div>
                    <button type="submit">Login →</button>
                </form>

                <p class="register">
                    Don't have an account? <a href="${pageContext.request.contextPath}/Register" class="register-link">Register</a>
                </p>
            </div>
        </aside>
    </section>

    <footer class="footer">
        <p>EDITORIAL FUNCTIONALISH &copy; 2026 CLAIMIT SYSTEM</p>
    </footer>

    <footer class="mobile_footer">
        <div class="footer_link">
            <a href="#">PRIVACY POLICY</a>
            <a href="#">TERMS OF SERVICES</a>
            <a href="#">SUPPORT</a>
        </div>
    </footer>
</body>

</html>