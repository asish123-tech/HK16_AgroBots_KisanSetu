<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - KisanSetu</title>
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
        .signup-card {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 450px;
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        .brand { font-size: 1.8rem; font-weight: 700; color: #2E7D47; margin-bottom: 10px; }
        .form-group { margin-bottom: 15px; text-align: left; }
        label { font-size: 0.9rem; color: #555; display: block; margin-bottom: 5px; }
        input {
            width: 100%; padding: 10px; border: 1px solid #ddd;
            border-radius: 8px; font-size: 0.95rem; outline: none; transition: 0.3s;
        }
        input:focus { border-color: #2E7D47; box-shadow: 0 0 5px rgba(46, 125, 71, 0.2); }
        .btn-signup {
            width: 100%; background: #2E7D47; color: white; padding: 12px;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: 600; cursor: pointer;
            transition: 0.3s; margin-top: 10px;
        }
        .btn-signup:hover { background: #256a3a; }
        .error-msg { color: #dc2626; font-size: 0.9rem; margin-bottom: 15px; }
        .link { font-size: 0.9rem; color: #666; margin-top: 15px; display: block; }
        .link a { color: #2E7D47; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>

    <div class="signup-card">
        <div class="brand">🌱 Join KisanSetu</div>
        <p style="color:#666; margin-bottom: 20px;">Create your farmer account</p>

        <% if(request.getAttribute("error") != null) { %>
            <p class="error-msg"><%= request.getAttribute("error") %></p>
        <% } %>

        <form action="/signup" method="post">
            <div class="form-group">
                <label>Farmer Name</label>
                <input type="text" name="fullName" placeholder="Enter full name" required>
            </div>
            
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="tel" name="mobileNumber" placeholder="Enter 10 digit number" 
                       maxlength="10" pattern="[0-9]{10}" 
                       title="Please enter exactly 10 digits" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" name="confirmPassword" placeholder="Confirm password" required>
            </div>

            <button type="submit" class="btn-signup">Register</button>
        </form>

        <div class="link">
            Already have an account? <a href="/login">Login Here</a>
        </div>
    </div>

</body>
</html>