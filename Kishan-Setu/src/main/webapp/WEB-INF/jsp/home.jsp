<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KishanSetu - Empowering Farmers</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* --- GLOBAL RESET --- */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fcfcfc; /* Very light background for the bottom part */
            color: #333;
            overflow-x: hidden;
        }

        /* --- HEADER / NAVBAR --- */
        header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }

        .brand-logo {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .lang-toggle {
            background: rgba(255, 255, 255, 0.9);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
            color: #333;
            text-decoration: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }
        .lang-toggle:hover { background: #fff; transform: translateY(-2px); }

        /* --- HERO SECTION --- */
		.hero {
		    position: relative;
		    height: 85vh; 
		    width: 100%;
		    background: url('${pageContext.request.contextPath}/images/hero-bg.jpg') no-repeat center center/cover;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		    color: white;
		    
		    /* ADD THIS LINE to push the bottom edge down slightly */
		    padding-bottom: 40px; 
		}

        /* The White Fade Effect at the bottom (Gradient) */
        .hero::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 150px;
            background: linear-gradient(to top, #fcfcfc, transparent);
        }

        /* Dark overlay to make text pop */
        .hero-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.3); /* Slight darkness */
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 10;
            margin-top: -50px; /* Slight upward adjustment */
        }

        .hero-title {
            font-family: 'Playfair Display', serif; /* Serif font like image */
            font-size: 5rem;
            margin-bottom: 10px;
            text-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .hero-subtitle {
            font-size: 1.2rem;
            font-weight: 300;
            margin-bottom: 40px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }

        .cta-btn {
            background-color: #2E7D47; /* The exact green shade */
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 15px rgba(46, 125, 71, 0.4);
            transition: transform 0.3s ease, background 0.3s;
        }

        .cta-btn:hover {
            background-color: #256a3a;
            transform: translateY(-3px);
        }

        /* --- FEATURES CARDS SECTION --- */
		.features-container {
		    position: relative;
		    z-index: 20;
		    display: flex;
		    justify-content: center;
		    gap: 30px;
		    padding: 0 50px;
		    
		    /* CHANGE THIS VALUE: */
		    margin-top: -10px; /* Changed from -60px to -30px to lower the cards */
		    
		    flex-wrap: wrap;
		    padding-bottom: 20px; /* Adds some space at the bottom of the page */
		}

        .feature-card {
            background: white;
            border-radius: 12px;
            padding: 40px 20px;
            width: 260px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08); /* Soft shadow */
            transition: transform 0.3s ease;
            border: 1px solid #f0f0f0;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .icon-wrapper {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .text-desc {
            font-size: 0.9rem;
            color: #555;
            line-height: 1.5;
            font-weight: 500;
        }

        /* Specific Icon Colors */
        .icon-water { color: #3b82f6; }   /* Blue */
        .icon-crop  { color: #2E7D47; }   /* Green */
        .icon-market{ color: #333; }      /* Black/Dark Grey */
        .icon-pest  { color: #e67e22; }   /* Orange */

        /* --- FOOTER --- */
        footer {
            text-align: center;
            padding: 60px 20px 30px;
            color: #888;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

    <header>
        <a href="#" class="brand-logo">
            <i class="fas fa-seedling"></i> KisanSetu
        </a>
        <a href="?lang=hi" class="lang-toggle">EN / हि</a>
    </header>

    <section class="hero">
        <div class="hero-overlay"></div> <div class="hero-content">
            <h1 class="hero-title">KisanSetu</h1>
            <p class="hero-subtitle">Empowering Farmers, From Seed to Sale</p>
            
            <a href="/login" class="cta-btn">
                <i class="fas fa-sprout"></i> Start Your Journey
            </a>
        </div>
    </section>

    <section class="features-container">
        <div class="feature-card">
            <div class="icon-wrapper icon-water">
                <i class="fas fa-tint"></i>
            </div>
            <p class="text-desc">Monitor local water levels<br>and plan irrigation</p>
        </div>

        <div class="feature-card">
            <div class="icon-wrapper icon-crop">
                <i class="fas fa-seedling"></i>
            </div>
            <p class="text-desc">Smart crop<br>recommendations for your<br>region</p>
        </div>

        <div class="feature-card">
            <div class="icon-wrapper icon-market">
                <i class="fas fa-arrow-trend-up"></i>
            </div>
            <p class="text-desc">Real-time market prices and<br>selling insights</p>
        </div>

        <div class="feature-card">
            <div class="icon-wrapper icon-pest">
                <i class="fas fa-bug"></i>
            </div>
            <p class="text-desc">Pest & disease treatment<br>recommendations</p>
        </div>
    </section>

    <footer>
        © 2026 KisanSetu — Empowering Farmers, From Seed to Sale
    </footer>

</body>
</html>