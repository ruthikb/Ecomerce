<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1"/>
       <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">

<title>User Dashboard</title>

<!-- BOOTSTRAP -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<!-- BOOTSTRAP ICONS -->

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<!-- GOOGLE FONT -->

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

:root{
    --primary:#0f172a;
    --secondary:#1e293b;
    --accent:#2563eb;
    --success:#22c55e;
    --warning:#f59e0b;
    --danger:#ef4444;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
    min-height:100vh;
    overflow-x:hidden;
    color:white;
}

/* NAVBAR */

.navbar{
    background:rgba(255,255,255,0.08)!important;
    backdrop-filter:blur(12px);
    border-bottom:1px solid rgba(255,255,255,0.1);
    padding:12px 25px;
}

.navbar-brand{
    color:white!important;
    font-size:26px;
    font-weight:700;
}

.nav-link{
    color:white!important;
    transition:0.3s;
}

.nav-link:hover{
    color:#93c5fd!important;
}

/* SIDEBAR */

.sidebar{
    position:fixed;
    top:75px;
    left:20px;
    width:270px;
    height:calc(100vh - 100px);
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border-radius:30px;
    padding:25px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    overflow-y:auto;
    z-index:100;
}

.sidebar-title{
    text-align:center;
    font-size:28px;
    font-weight:700;
    margin-bottom:30px;
}

.menu-card{
    background:rgba(255,255,255,0.05);
    border-radius:20px;
    margin-bottom:20px;
    overflow:hidden;
    transition:0.4s;
}

.menu-card:hover{
    transform:translateY(-5px);
    background:rgba(255,255,255,0.08);
}

.menu-toggle{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 20px;
    text-decoration:none;
    color:white;
    font-weight:600;
}

.menu-toggle:hover{
    color:#93c5fd;
}

.menu-toggle i{
    font-size:18px;
}

.sub-menu{
    padding:10px 15px 15px;
}

.sub-menu a{
    display:block;
    padding:12px 15px;
    margin-bottom:10px;
    border-radius:15px;
    text-decoration:none;
    color:#dbeafe;
    transition:0.3s;
    background:rgba(255,255,255,0.04);
}

.sub-menu a:hover{
    background:rgba(255,255,255,0.1);
    transform:translateX(5px);
    color:white;
}

/* MAIN CONTENT */

.main-content{
    margin-left:310px;
    margin-top:100px;
    padding:30px;
    padding-bottom:100px;
}

/* HERO SECTION */

.hero-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:35px;
    padding:40px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    margin-bottom:35px;
    position:relative;
    overflow:hidden;
    animation:fadeIn 1s ease;
}

.hero-card::before{
    content:'';
    position:absolute;
    width:200px;
    height:200px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-70px;
    right:-70px;
}

.hero-title{
    font-size:45px;
    font-weight:700;
    margin-bottom:15px;
}

.hero-text{
    color:#dbeafe;
    font-size:17px;
    max-width:700px;
}

/* DASHBOARD CARDS */

.dashboard-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

.dashboard-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:28px;
    padding:30px;
    border:1px solid rgba(255,255,255,0.1);
    transition:0.4s;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    position:relative;
    overflow:hidden;
}

.dashboard-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

.dashboard-card::before{
    content:'';
    position:absolute;
    width:120px;
    height:120px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-40px;
    right:-40px;
}

.dashboard-icon{
    width:75px;
    height:75px;
    border-radius:20px;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:32px;
    margin-bottom:20px;
    color:white;
}

.sales-icon{
    background:linear-gradient(45deg,#2563eb,#60a5fa);
}

.purchase-icon{
    background:linear-gradient(45deg,#22c55e,#4ade80);
}

.report-icon{
    background:linear-gradient(45deg,#f59e0b,#facc15);
}

.profile-icon{
    background:linear-gradient(45deg,#ef4444,#f87171);
}

.dashboard-card h3{
    font-size:26px;
    font-weight:700;
    margin-bottom:10px;
}

.dashboard-card p{
    color:#dbeafe;
    margin-bottom:20px;
}

.dashboard-btn{
    display:inline-flex;
    align-items:center;
    gap:8px;
    padding:12px 20px;
    border-radius:15px;
    text-decoration:none;
    color:white;
    font-weight:600;
    transition:0.3s;
    background:rgba(255,255,255,0.1);
}

.dashboard-btn:hover{
    transform:translateY(-3px);
    background:rgba(255,255,255,0.18);
    color:white;
}

/* FOOTER */

footer{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(10px);
    border-top:1px solid rgba(255,255,255,0.1);
    color:white;
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
    height:60px;
    display:flex;
    align-items:center;
    justify-content:center;
    z-index:1000;
}

footer .date-time{
    position:absolute;
    right:20px;
    color:#93c5fd;
    font-weight:600;
}

footer p{
    margin:0;
}

/* ANIMATION */

@keyframes fadeIn{

    from{
        opacity:0;
        transform:translateY(30px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* RESPONSIVE */

@media(max-width:991px){

    .sidebar{
        position:relative;
        width:100%;
        left:0;
        top:90px;
        height:auto;
        margin-bottom:20px;
    }

    .main-content{
        margin-left:0;
        margin-top:120px;
    }

    .hero-title{
        font-size:32px;
    }

    footer .date-time{
        display:none;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <div class="container-fluid">

        <a class="navbar-brand"
           href="Admin.jsp">

            <i class="bi bi-laptop"></i>
            Vendor Management System

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse justify-content-end"
             id="navbarContent">

            <ul class="navbar-nav align-items-center">

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                        User

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <a class="dropdown-item"
                               href="logOut">

                                Log-Out

                            </a>

                        </li>

                    </ul>

                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="sidebar-title">

        User Menu

    </div>

    <!-- SALES -->

    <div class="menu-card">

        <a class="menu-toggle"
           data-bs-toggle="collapse"
           href="#salesMenu">

            <span>

                <i class="bi bi-cart me-2"></i>
                Sales

            </span>

            <i class="bi bi-chevron-down"></i>

        </a>

        <div class="collapse sub-menu"
             id="salesMenu">

            <a href="addSales">

                Add Sales

            </a>

            <a href="viewSales">

                View Sales

            </a>

        </div>

    </div>

    <!-- PURCHASE -->

    <div class="menu-card">

        <a class="menu-toggle"
           data-bs-toggle="collapse"
           href="#purchaseMenu">

            <span>

                <i class="bi bi-box me-2"></i>
                Purchase

            </span>

            <i class="bi bi-chevron-down"></i>

        </a>

        <div class="collapse sub-menu"
             id="purchaseMenu">

            <a href="addPurchase">

                Add Purchase

            </a>

            <a href="viewPurchase">

                View Purchase

            </a>

        </div>

    </div>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <!-- HERO -->

    <div class="hero-card">

        <h1 class="hero-title">

            Welcome,
            ${userDto.firstName()} 👋

        </h1>

        <p class="hero-text">

            Manage your sales, purchases, reports,
            and business activities with a modern
            Vendor Management Dashboard.

        </p>

    </div>

    <!-- DASHBOARD GRID -->

    <div class="dashboard-grid">

        <!-- SALES -->

        <div class="dashboard-card">

            <div class="dashboard-icon sales-icon">

                <i class="bi bi-cart-check"></i>

            </div>

            <h3>

                Sales Management

            </h3>

            <p>

                Add and manage all sales records
                efficiently from your dashboard.

            </p>

            <a href="viewSales"
               class="dashboard-btn">

                <i class="bi bi-arrow-right"></i>
                View Sales

            </a>

        </div>

        <!-- PURCHASE -->

        <div class="dashboard-card">

            <div class="dashboard-icon purchase-icon">

                <i class="bi bi-box-seam"></i>

            </div>

            <h3>

                Purchase Management

            </h3>

            <p>

                Track and manage all purchase
                activities in one place.

            </p>

            <a href="viewPurchase"
               class="dashboard-btn">

                <i class="bi bi-arrow-right"></i>
                View Purchase

            </a>

        </div>



    </div>

</div>

<!-- FOOTER -->

<footer>

    <span id="dateTime"
          class="date-time"></span>

    <p>
        © 2026 Vendor Management System | All Rights Reserved
    </p>

</footer>

<!-- SCRIPT -->

<script>

function updateDateTime(){

    document.getElementById("dateTime").textContent =
        new Date().toLocaleString();

}

setInterval(updateDateTime,1000);

updateDateTime();

</script>

<!-- BOOTSTRAP -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>