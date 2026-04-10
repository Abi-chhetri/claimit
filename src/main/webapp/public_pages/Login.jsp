<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css">
</head>

<body>
    <header class="Desktop_header">
        <div class="logo">ClaimIt</div>
        <nav>
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#" class="active"> Login</a>
            <a href="#">Registration</a>
        </nav>
    </header>

    <header class="mobile_header">
        <img src="../images/logo.jpeg" alt="logo" class="mobile-logo">
        <h2>ClaimIt</h2>
        <p class="portal">Digital Concierge Portal</p>
    </header>
	
    <section class="container">
        <aside class="image">
            <img src="../images/left.png" alt="logo">
        </aside>

        <aside class="right">
            <div class="login-box">
                <div class="form-header">
                    <img src="../images/logo.jpeg" alt="ClaimIt Logo" class="form-logo">
                    <h2>ClaimIt</h2>
                </div>
                
                <h1>Welcome back</h1>
                <p class="subtitle">Enter your credentials to access the portal</p>

                <form>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email">

                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" placeholder="password">
                        <a href="#" class="forgot-pass">Forgot Password?</a>
                    </div>

                    <div class="rember-me">
                        <input type="checkbox" id="remember">
                        <label for="remember">Keep me logged in</label>
                    </div>

                    <button type="submit">Login →</button>
                </form>


                <p class="register">Don't have an account?
                    <a href="#" class="register-link">Register</a>
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