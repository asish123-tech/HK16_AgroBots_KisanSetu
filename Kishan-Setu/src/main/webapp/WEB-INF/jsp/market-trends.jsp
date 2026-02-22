<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Live Market Sales - KisanSetu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root { 
            --agri-green: #15803d; 
            --agri-light: #f0fdf4;
            --text-main: #1e293b;
            --text-muted: #64748b;
        }

        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%); 
            margin: 0; 
            padding: 20px; 
            color: var(--text-main);
            min-height: 100vh;
        }

        .dashboard-card { 
            max-width: 900px; /* Slimmer card since we have fewer columns */
            margin: 20px auto; 
            background: rgba(255, 255, 255, 0.95); 
            border-radius: 20px; 
            padding: 30px; 
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1); 
            backdrop-filter: blur(10px);
        }

        .search-container {
            position: relative;
            margin: 20px 0;
        }
        .search-container i {
            position: absolute;
            left: 15px;
            top: 15px;
            color: var(--text-muted);
        }
        .search-input {
            width: 100%;
            padding: 12px 12px 12px 45px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            outline: none;
            font-size: 1rem;
            transition: 0.3s;
            box-sizing: border-box;
        }
        .search-input:focus {
            border-color: var(--agri-green);
            box-shadow: 0 0 0 4px rgba(21, 128, 61, 0.1);
        }

        .live-dot { 
            height: 12px; width: 12px; 
            background-color: #ef4444; 
            border-radius: 50%; 
            display: inline-block; 
            margin-right: 8px; 
            box-shadow: 0 0 8px rgba(239, 68, 68, 0.6);
            animation: pulse 1.5s infinite; 
        }
        @keyframes pulse { 0% { opacity: 1; } 50% { opacity: 0.4; } 100% { opacity: 1; } }

        .table-responsive {
            max-height: 700px; /* Increased height for 400 crops */
            overflow-y: auto;
            border-radius: 12px;
            border: 1px solid #f1f5f9;
        }
        table { width: 100%; border-collapse: collapse; background: white; }
        
        thead th { 
            position: sticky; 
            top: 0; 
            background: var(--agri-green); 
            color: white; 
            z-index: 10;
            text-align: left; 
            padding: 15px; 
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
        }

        td { padding: 16px 15px; border-bottom: 1px solid #f1f5f9; font-size: 0.95rem; }
        tr:hover td { background-color: var(--agri-light); }

        .price-tag { 
            color: var(--agri-green); 
            font-weight: 700; 
            font-size: 1.1rem; 
            text-align: right;
        }

        .variety-badge {
            background: #e2e8f0;
            color: #475569;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .back-link {
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 500;
            transition: 0.2s;
        }
        .back-link:hover { color: var(--agri-green); }

        .no-data {
            padding: 40px;
            text-align: center;
            background: #fff;
            border-radius: 12px;
            color: var(--text-muted);
        }
    </style>
</head>
<body>

    <div class="dashboard-card">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <a href="choice" class="back-link"><i class="fas fa-arrow-left me-2"></i> Back to Market</a>
                <h2 style="margin-top: 15px; margin-bottom: 5px;">
                    <span class="live-dot"></span> Live Mandi Prices
                </h2>
                <p style="color: var(--text-muted); margin: 0;">Showing current rates for 400+ agricultural commodities</p>
            </div>
        </div>

        <div class="search-container">
            <i class="fas fa-search"></i>
            <input type="text" id="mandiSearch" class="search-input" placeholder="Search for crops (e.g. Wheat, Saffron, Apple)..." onkeyup="filterMandi()">
        </div>

        <div class="table-responsive">
            <table id="mandiTable">
                <thead>
                    <tr>
                        <th style="width: 40%;">Commodity</th>
                        <th style="width: 30%;">Variety</th>
                        <th style="width: 30%; text-align: right;">Price (₹/Quintal)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty trends}">
                            <tr>
                                <td colspan="3" class="no-data">
                                    <i class="fas fa-info-circle me-2"></i> No data found.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="item" items="${trends}">
                                <tr>
                                    <td style="font-weight: 600;">
                                        <c:out value="${item.commodity}"/>
                                    </td>
                                    <td>
                                        <span class="variety-badge">
                                            <c:out value="${item.variety}"/>
                                        </span>
                                    </td>
                                    <td class="price-tag">
                                        ₹<c:out value="${item.modal_price}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function filterMandi() {
            let input = document.getElementById("mandiSearch");
            let filter = input.value.toUpperCase();
            let table = document.getElementById("mandiTable");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                // Column 0 is Commodity
                let td = tr[i].getElementsByTagName("td")[0]; 
                if (td) {
                    let textValue = td.textContent || td.innerText;
                    tr[i].style.display = textValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
                }
            }
        }
    </script>
</body>
</html>