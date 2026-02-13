<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KisanSetu - Welcome</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        /* --- RESET & BASIC SETUP --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            width: 100%;
            /* Professional Green Gradient Background */
            background: linear-gradient(135deg, #134E5E 0%, #71B280 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
            overflow: hidden;
            position: relative;
        }

        /* --- BACKGROUND PATTERN (Optional: Adds Texture) --- */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background-image: url('https://www.transparenttextures.com/patterns/cubes.png'); /* Subtle texture */
            opacity: 0.1;
            z-index: 0;
        }

        /* --- CONTENT CONTAINER --- */
        .splash-container {
            text-align: center;
            z-index: 10;
            animation: fadeUp 1.2s ease-out forwards;
            opacity: 0; /* Starts hidden */
        }

        /* --- LOGO STYLING --- */
        .logo-icon {
            font-size: 80px;
            margin-bottom: 10px;
            text-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        .app-name {
            font-size: 3.5rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 5px;
            text-shadow: 2px 2px 15px rgba(0,0,0,0.3);
        }

        .app-name span {
            color: #ffeb3b; /* Yellow highlight for 'Setu' */
        }

        .tagline {
            font-size: 1.2rem;
            font-weight: 300;
            color: #f0fdf4;
            margin-bottom: 40px;
            opacity: 0.9;
        }
        
        /* Hindi Translation for Inclusivity */
        .hindi-text {
            display: block;
            font-size: 1rem;
            margin-top: 5px;
            opacity: 0.8;
        }

        /* --- LOADING SPINNER --- */
        .loader {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: #ffeb3b; /* Yellow spinner */
            animation: spin 1s ease-in-out infinite;
            margin: 0 auto;
        }

        /* --- FOOTER --- */
        .footer-text {
            position: absolute;
            bottom: 20px;
            font-size: 0.9rem;
            opacity: 0.6;
            z-index: 10;
        }

        /* --- ANIMATIONS --- */
        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

    <div class="splash-container">
        <div class="logo-icon">🌱</div> 
        
        <h1 class="app-name">Kisan<span>Setu</span></h1>
        
        <div class="tagline">
            Empowering Farmers, Transforming Future
            <span class="hindi-text">किसानों का सच्चा साथी</span>
        </div>

        <div class="loader"></div>
    </div>

    <div class="footer-text">© 2026 Kisan-Setu Smart Way Of Farming</div>

    <script>
        // Wait for 3500ms (3.5 seconds) then redirect
        setTimeout(function() {
            // Change 'home' to whatever your mapped URL is (e.g., /login or /home)
            window.location.href = '/home'; 
        }, 3500);
    </script>

</body>
</html>