<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1"/>
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
    --success:#22c55e;
    --danger:#ef4444;
    --warning:#f59e0b;
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
    width:260px;
    height:calc(100vh - 100px);
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border-radius:30px;
    padding:25px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    z-index:100;
}

.sidebar-title{
    text-align:center;
    font-size:26px;
    font-weight:700;
    margin-bottom:30px;
}

.menu-link{
    display:flex;
    align-items:center;
    gap:12px;
    padding:15px 18px;
    margin-bottom:15px;
    border-radius:18px;
    text-decoration:none;
    color:white;
    transition:0.3s;
    font-weight:500;
}

.menu-link:hover{
    background:rgba(255,255,255,0.12);
    transform:translateX(5px);
    color:#93c5fd;
}

.menu-link i{
    font-size:20px;
}

/* MAIN CONTENT */

.main-content{
    margin-left:300px;
    margin-top:100px;
    padding:30px;
    padding-bottom:100px;
}

/* HEADER */

.header-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:30px;
    padding:35px;
    margin-bottom:30px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    animation:fadeIn 1s ease;
}

.header-card h1{
    font-size:42px;
    font-weight:700;
    margin-bottom:10px;
}

.header-card p{
    color:#dbeafe;
    font-size:16px;
}

/* STATS */

.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin-bottom:35px;
}

.stats-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:25px;
    padding:25px;
    border:1px solid rgba(255,255,255,0.1);
    transition:0.4s;
}

.stats-card:hover{
    transform:translateY(-8px);
}

.stats-card i{
    font-size:40px;
    margin-bottom:15px;
    color:#93c5fd;
}

.stats-card h2{
    font-size:30px;
    font-weight:700;
}

.stats-card p{
    color:#dbeafe;
    margin-top:5px;
}

/* ORDER GRID */

.order-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(350px,1fr));
    gap:25px;
}

/* ORDER CARD */

.order-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:30px;
    padding:25px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    transition:0.4s;
    position:relative;
    overflow:hidden;
    animation:fadeIn 1s ease;
}

.order-card:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

.order-card::before{
    content:'';
    position:absolute;
    width:140px;
    height:140px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-40px;
    right:-40px;
}

/* CARD TOP */

.card-top{
    display:flex;
    align-items:center;
    gap:18px;
    margin-bottom:25px;
}

.card-icon{
    width:80px;
    height:80px;
    border-radius:50%;
    background:linear-gradient(45deg,#2563eb,#60a5fa);
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:34px;
    color:white;
    box-shadow:0 8px 20px rgba(96,165,250,0.4);
}

.order-title{
    font-size:24px;
    font-weight:700;
    margin-bottom:5px;
}

.order-id{
    color:#93c5fd;
    font-size:14px;
}

/* DETAILS */

.order-details{
    display:flex;
    flex-direction:column;
    gap:18px;
}

.detail-box{
    background:rgba(255,255,255,0.06);
    border-radius:18px;
    padding:15px;
}

.detail-label{
    display:block;
    font-size:13px;
    color:#93c5fd;
    margin-bottom:6px;
    font-weight:600;
}

.detail-value{
    color:white;
    font-size:15px;
}

/* STATUS */

.status-badge{
    display:inline-block;
    padding:8px 16px;
    border-radius:30px;
    font-size:13px;
    font-weight:600;
}

.approved{
    background:rgba(34,197,94,0.2);
    color:#4ade80;
}

.rejected{
    background:rgba(239,68,68,0.2);
    color:#f87171;
}

.pending{
    background:rgba(245,158,11,0.2);
    color:#facc15;
}

/* ACTIONS */

.card-actions{
    display:flex;
    gap:15px;
    margin-top:25px;
}

.action-btn{
    flex:1;
    height:50px;
    border:none;
    border-radius:16px;
    font-weight:600;
    color:white;
    transition:0.3s;
}

.approve-btn{
    background:linear-gradient(45deg,#22c55e,#4ade80);
}

.reject-btn{
    background:linear-gradient(45deg,#dc2626,#f87171);
}

.action-btn:hover{
    transform:translateY(-4px);
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

    .header-card h1{
        font-size:30px;
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

                <li class="nav-item me-3">

                    <a href="notification"
                       class="nav-link">

                        <i class="bi bi-bell fs-5"></i>

                    </a>

                </li>

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                        ${userDto.firstName()}

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

        Menu

    </div>

    <a href="addCustomerPage"
       class="menu-link">

        <i class="bi bi-person-plus"></i>
        Add Customer

    </a>

    <a href="getAllCustomers"
       class="menu-link">

        <i class="bi bi-people"></i>
        View Customers

    </a>

    <a href="viewUser"
       class="menu-link">

        <i class="bi bi-person"></i>
        View User

    </a>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <!-- HEADER -->

    <div class="header-card">

        <h1>

            Pending Purchase Requests

        </h1>

        <p>

            Manage product approval and rejection requests
            from customers in the Vendor Management System.

        </p>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <div class="stats-card">

            <i class="bi bi-cart-check"></i>

            <h2>

                ${pendingOrders.size()}

            </h2>

            <p>Total Requests</p>

        </div>

        <div class="stats-card">

            <i class="bi bi-clock-history"></i>

            <h2>Live</h2>

            <p>Pending Actions</p>

        </div>

    </div>

    <!-- ORDER GRID -->

    <div class="order-grid">

        <c:forEach var="order"
                   items="${pendingOrders}">

            <!-- ORDER CARD -->

            <div class="order-card">

                <!-- TOP -->

                <div class="card-top">

                    <div class="card-icon">

                        <i class="bi bi-box-seam"></i>

                    </div>

                    <div>

                        <h3 class="order-title">

                            ${order.itemName}

                        </h3>

                        <span class="order-id">

                            Order ID :
                            #${order.id}

                        </span>

                    </div>

                </div>

                <!-- DETAILS -->

                <div class="order-details">

                    <div class="detail-box">

                        <span class="detail-label">

                            Customer Name

                        </span>

                        <span class="detail-value">

                            ${order.customer.customerName}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Product Model

                        </span>

                        <span class="detail-value">

                            ${order.model}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Purchase Price

                        </span>

                        <span class="detail-value">

                            ₹ ${order.purchasePrice}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Status

                        </span>

                        <c:choose>

                            <c:when test="${order.status == 'APPROVED'}">

                                <span class="status-badge approved">

                                    Approved

                                </span>

                            </c:when>

                            <c:when test="${order.status == 'REJECTED'}">

                                <span class="status-badge rejected">

                                    Rejected

                                </span>

                            </c:when>

                            <c:otherwise>

                                <span class="status-badge pending">

                                    Pending

                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

                <!-- ACTIONS -->

                <div class="card-actions">

                    <!-- APPROVE -->

                    <form action="approved"
                          method="post"
                          class="flex-fill">

                        <input type="hidden"
                               name="id"
                               value="${order.id}"/>

                        <button type="submit"
                                class="action-btn approve-btn w-100">

                            <i class="bi bi-check-circle"></i>
                            Approve

                        </button>

                    </form>

                    <!-- REJECT -->

                    <form action="rejected"
                          method="post"
                          class="flex-fill">

                        <input type="hidden"
                               name="id"
                               value="${order.id}"/>

                        <button type="submit"
                                class="action-btn reject-btn w-100">

                            <i class="bi bi-x-circle"></i>
                            Reject

                        </button>

                    </form>

                </div>

            </div>

        </c:forEach>

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