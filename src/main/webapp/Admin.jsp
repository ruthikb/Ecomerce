<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>Admin Dashboard</title>

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
            --card:#ffffff15;
            --text:#ffffff;
        }

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background: linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
            min-height:100vh;
            overflow-x:hidden;
            color:white;
        }

        /* NAVBAR */

        .navbar{
            background: rgba(255,255,255,0.08) !important;
            backdrop-filter: blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.1);
            padding:12px 20px;
        }

        .navbar-brand{
            font-size:24px;
            font-weight:700;
            color:white !important;
        }

        .nav-link{
            color:white !important;
            transition:0.3s;
        }

        .nav-link:hover{
            color:#93c5fd !important;
        }

        /* SIDEBAR */

        .sidebar{
            position:fixed;
            top:75px;
            left:20px;
            width:260px;
            height:calc(100vh - 110px);
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:25px;
            padding:25px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
        }

        .sidebar-title{
            text-align:center;
            font-size:22px;
            font-weight:700;
            margin-bottom:25px;
            color:white;
        }

        .menu-link{
            display:flex;
            align-items:center;
            padding:15px;
            border-radius:15px;
            margin-bottom:15px;
            text-decoration:none;
            color:white;
            transition:0.3s;
            font-size:16px;
            font-weight:500;
        }

        .menu-link i{
            margin-right:12px;
            font-size:20px;
        }

        .menu-link:hover{
            background: rgba(255,255,255,0.12);
            transform:translateX(5px);
            color:#93c5fd;
        }

        /* MAIN CONTENT */

        .main-content{
            margin-left:300px;
            margin-top:100px;
            padding:30px;
        }

        .welcome-card{
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:30px;
            padding:40px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
            margin-bottom:30px;
            animation:fadeIn 1s ease;
        }

        .welcome-card h1{
            font-size:40px;
            font-weight:700;
            margin-bottom:10px;
        }

        .welcome-card p{
            color:#dbeafe;
            font-size:17px;
        }

        /* DASHBOARD CARDS */

        .dashboard-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px;
        }

        .dashboard-card{
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:25px;
            padding:30px;
            border:1px solid rgba(255,255,255,0.1);
            transition:0.4s;
            box-shadow:0 10px 25px rgba(0,0,0,0.25);
        }

        .dashboard-card:hover{
            transform:translateY(-10px) scale(1.02);
            box-shadow:0 15px 30px rgba(0,0,0,0.35);
        }

        .dashboard-card i{
            font-size:45px;
            margin-bottom:20px;
            color:#60a5fa;
        }

        .dashboard-card h3{
            font-size:28px;
            font-weight:700;
        }

        .dashboard-card p{
            color:#dbeafe;
            margin-top:8px;
        }

        /* QUICK ACTIONS */

        .action-section{
            margin-top:40px;
        }

        .action-title{
            font-size:28px;
            margin-bottom:25px;
            font-weight:700;
        }

        .action-buttons{
            display:flex;
            flex-wrap:wrap;
            gap:20px;
        }

        .action-btn{
            padding:15px 30px;
            border:none;
            border-radius:15px;
            background:linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-size:16px;
            font-weight:600;
            transition:0.4s;
            text-decoration:none;
        }

        .action-btn:hover{
            transform:translateY(-5px);
            box-shadow:0 10px 20px rgba(96,165,250,0.5);
        }

        /* FOOTER */

        footer{
            position:fixed;
            bottom:0;
            left:0;
            width:100%;
            height:60px;
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
            border-top:1px solid rgba(255,255,255,0.1);
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
            z-index:1000;
        }

        .date-time{
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

            .action-buttons{
                flex-direction:column;
            }

            .date-time{
                display:none;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <div class="container-fluid">

        <!-- LOGO -->

        <a class="navbar-brand" href="Admin.jsp">

            <i class="bi bi-laptop"></i>
            Vendor Management System

        </a>

        <!-- TOGGLER -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- RIGHT SIDE -->

        <div class="collapse navbar-collapse justify-content-end"
             id="navbarContent">

            <ul class="navbar-nav align-items-center">

                <!-- NOTIFICATION -->

                <li class="nav-item me-3">

                    <a href="notification"
                       class="nav-link">

                        <i class="bi bi-bell-fill fs-5"></i>

                    </a>

                </li>

                <!-- USER -->

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                       Admin

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

        Admin Menu

    </div>

    <a href="addCustomerPage"
       class="menu-link">

        <i class="bi bi-person-plus-fill"></i>

        Add Customer

    </a>

    <a href="getAllCustomers"
       class="menu-link">

        <i class="bi bi-people-fill"></i>

        View Customers

    </a>

    <a href="viewUser"
       class="menu-link">

        <i class="bi bi-person-fill"></i>

        View User

    </a>



</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <!-- WELCOME CARD -->

    <div class="welcome-card">

        <h1>

            Welcome Admin 👋

        </h1>

        <p>

            Manage customers, vendors, users and notifications
            using this modern Vendor Management Dashboard.

        </p>

    </div>



    <!-- QUICK ACTIONS -->

    <div class="action-section">

        <h2 class="action-title">

            Quick Actions

        </h2>

        <div class="action-buttons">

            <a href="addCustomerPage"
               class="action-btn">

                <i class="bi bi-person-plus-fill"></i>
                Add Customer

            </a>

            <a href="getAllCustomers"
               class="action-btn">

                <i class="bi bi-people-fill"></i>
                View Customers

            </a>

            <a href="viewUser"
               class="action-btn">

                <i class="bi bi-person-fill"></i>
                View User

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