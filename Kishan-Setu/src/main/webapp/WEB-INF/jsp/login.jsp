<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - KisanSetu</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0fdf4 0%, #ffffff 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        .brand { font-size: 1.8rem; font-weight: 700; color: #2E7D47; margin-bottom: 20px; }
        .form-group { margin-bottom: 20px; text-align: left; }
        label { font-size: 0.9rem; color: #555; display: block; margin-bottom: 5px; }
        input {
            width: 100%; padding: 12px; border: 1px solid #ddd;
            border-radius: 8px; font-size: 1rem; outline: none; transition: 0.3s;
        }
        input:focus { border-color: #2E7D47; box-shadow: 0 0 5px rgba(46, 125, 71, 0.2); }
        .btn-login {
            width: 100%; background: #2E7D47; color: white; padding: 12px;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: 600; cursor: pointer;
            transition: 0.3s;
        }
        .btn-login:hover { background: #256a3a; }
        .error-msg { color: #dc2626; font-size: 0.9rem; margin-bottom: 15px; }
        .success-msg { color: #2E7D47; font-size: 0.9rem; margin-bottom: 15px; }
        .link { font-size: 0.9rem; color: #666; margin-top: 15px; display: block; }
        .link a { color: #2E7D47; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="brand">🌱 KisanSetu</div>
        <h3>Welcome Back</h3>

        <% if(request.getAttribute("error") != null) { %>
            <p class="error-msg"><%= request.getAttribute("error") %></p>
        <% } %>
        <% if(request.getParameter("success") != null) { %>
            <p class="success-msg">Registration Successful! Please Login.</p>
        <% } %>

        <form action="/login" method="post">
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="tel" name="mobileNumber" placeholder="Enter 10 digit number" maxlength="10" pattern="[0-9]{10}" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>

        <div class="link">
            New User? <a href="/signup">Register Here</a>
        </div>
    </div>

</body>
</html>