<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // --- DEMO VALUES (Delete these once your Servlet is connected) ---
    request.setAttribute("village", "Ramgarh");
    request.setAttribute("district", "Alwar");
    request.setAttribute("waterLevel", 12.5); // Depth in meters
    request.setAttribute("waterStatus", "Semi-Critical");
    request.setAttribute("trendText", "Decreasing");
    request.setAttribute("trendIcon", "fa-arrow-trend-down");
    request.setAttribute("trendColor", "text-danger");
    request.setAttribute("availabilityText", "Moderate");
    request.setAttribute("farmerAdvice", "Water levels are dropping. Switch from flood irrigation to drip irrigation. Consider planting Mustard or Pearl Millet (Bajra) instead of high-water crops.");
%>
<!DOCTYPE html>
<html>
<head>
    <title>KisanSetu - Water Intelligence</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-blue: #0061ff;
            --deep-blue: #2575fc;
            --nature-green: #2ecc71;
            --earth-brown: #795548;
        }

        body { 
            background: linear-gradient(135deg, #e0f2fe 0%, #f1f5f9 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: #1e293b;
        }

        .nav-header {
            background: white;
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .water-card { 
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.08); 
            transition: transform 0.3s ease; 
        }

        .water-card:hover { transform: translateY(-5px); }

        .gauge-container { 
            height: 320px; 
            width: 75px; 
            background: #cbd5e1; 
            border-radius: 40px; 
            position: relative; 
            margin: 0 auto; 
            border: 6px solid #f8fafc;
            box-shadow: inset 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .gauge-fill { 
            width: 100%; 
            position: absolute; 
            bottom: 0; 
            border-radius: 0 0 40px 40px; 
            transition: height 1.5s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Bubble effect */
        .gauge-fill::after {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-image: radial-gradient(circle, white 10%, transparent 10%);
            background-size: 20px 20px;
            opacity: 0.1;
        }

        .status-badge { 
            padding: 10px 24px; 
            border-radius: 30px; 
            font-weight: 700; 
            text-transform: uppercase;
        }

        .advice-box { 
            background: linear-gradient(to right, #ffffff, #f0f7ff);
            border-left: 6px solid var(--primary-blue); 
            padding: 20px; 
            border-radius: 12px; 
            margin-top: 25px;
        }

        .btn-back {
            background: #fff;
            color: #475569;
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 12px;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="nav-header">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="dashboard.jsp" class="btn btn-back px-4 py-2">
            <i class="fas fa-arrow-left me-2"></i> Dashboard
        </a>
        <div class="text-end">
            <span class="badge bg-primary rounded-pill px-3">Demo Preview</span>
        </div>
    </div>
</div>

<div class="container">
    <div class="text-center mb-5">
        <h2 class="fw-bold"><i class="fas fa-faucet-drip text-primary me-2"></i>Water Level Insights</h2>
        <p class="text-secondary fs-5">Village: <span class="text-dark fw-semibold">${village}</span> | District: <span class="text-dark fw-semibold">${district}</span></p>
    </div>

    <div class="row g-4 justify-content-center">
        <div class="col-lg-4 col-md-5">
            <div class="card water-card p-4 text-center">
                <h5 class="text-uppercase text-secondary small fw-bold mb-4">Well Depth Visual</h5>
                <div class="gauge-container mb-4">
                    <%-- 
                        Logic: 
                        If waterLevel is 0 (Full), height is 100%. 
                        If waterLevel is 40 (Dry), height is 0%.
                    --%>
                    <div class="gauge-fill" 
                         style="height: ${100 - (waterLevel * 2.5)}%; 
                                background: ${waterLevel < 7 ? 'linear-gradient(to top, #00b09b, #96c93d)' : (waterLevel < 15 ? 'linear-gradient(to top, #f83600, #f9d423)' : 'linear-gradient(to top, #cb2d3e, #ef473a)')};">
                    </div>
                </div>
                <h2 class="fw-bold mb-0">${waterLevel} m</h2>
                <p class="text-uppercase small fw-bold text-muted">Below Ground Level</p>
            </div>
        </div>

        <div class="col-lg-7 col-md-7">
            <div class="card water-card p-4 h-100">
                <div class="d-flex justify-content-between align-items-start mb-4">
                    <div>
                        <h4 class="fw-bold mb-1">Health Summary</h4>
                        <p class="text-muted small">Updated: January 2024</p>
                    </div>
                    <span class="status-badge 
                        ${waterLevel < 7 ? 'bg-success text-white' : (waterLevel < 15 ? 'bg-warning text-dark' : 'bg-danger text-white')} shadow-sm">
                        ${waterStatus}
                    </span>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-light">
                            <p class="text-muted small mb-1">30-Year Trend</p>
                            <h5 class="${trendColor} fw-bold m-0">
                                <i class="fas ${trendIcon} me-1"></i> ${trendText}
                            </h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-3 border rounded-4 bg-light">
                            <p class="text-muted small mb-1">Availability</p>
                            <h5 class="text-dark fw-bold m-0">${availabilityText}</h5>
                        </div>
                    </div>
                </div>

                <div class="advice-box">
                    <div class="d-flex align-items-center mb-2">
                        <div class="bg-warning text-white rounded-circle p-2 me-3" style="width:35px; height:35px; display:flex; align-items:center; justify-content:center;">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h6 class="fw-bold m-0">Farmer Action Plan:</h6>
                    </div>
                    <p class="lead fs-6 text-dark mb-0" style="line-height: 1.6;">
                        ${farmerAdvice}
                    </p>
                </div>

                <div class="mt-auto pt-4">
                    <button class="btn btn-primary w-100 rounded-3 py-2 fw-bold shadow">
                        <i class="fas fa-chart-line me-2"></i> View Historical Data
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>