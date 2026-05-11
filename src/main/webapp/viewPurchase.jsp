<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>

<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
<title>View Purchase Orders</title>

<!-- BOOTSTRAP -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<!-- BOOTSTRAP ICONS -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet">

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

/* HERO */

.hero-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:35px;
    padding:35px;
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
    width:180px;
    height:180px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-60px;
    right:-60px;
}

.hero-title{
    font-size:42px;
    font-weight:700;
    margin-bottom:12px;
}

.hero-text{
    color:#dbeafe;
    font-size:16px;
}

/* STATS */

.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin-bottom:30px;
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
    font-size:38px;
    color:#93c5fd;
    margin-bottom:15px;
}

.stats-card h2{
    font-size:30px;
    font-weight:700;
}

.stats-card p{
    color:#dbeafe;
    margin-top:5px;
}

/* SEARCH */

.search-box{
    margin-bottom:30px;
}

.search-input{
    width:100%;
    height:58px;
    border:none;
    border-radius:18px;
    background:rgba(255,255,255,0.1);
    color:white;
    padding:0 20px;
    font-size:16px;
    outline:none;
}

.search-input::placeholder{
    color:#dbeafe;
}

/* PURCHASE GRID */

.purchase-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(360px,1fr));
    gap:25px;
}

/* PURCHASE CARD */

.purchase-card{
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

.purchase-card:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

.purchase-card::before{
    content:'';
    position:absolute;
    width:140px;
    height:140px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-40px;
    right:-40px;
}

/* TOP */

.card-top{
    display:flex;
    align-items:center;
    gap:18px;
    margin-bottom:25px;
}

.card-icon{
    width:80px;
    height:80px;
    border-radius:25px;
    background:linear-gradient(45deg,#2563eb,#60a5fa);
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:34px;
    color:white;
    box-shadow:0 8px 20px rgba(96,165,250,0.4);
}

.purchase-title{
    font-size:24px;
    font-weight:700;
    margin-bottom:5px;
}

.purchase-id{
    color:#93c5fd;
    font-size:14px;
}

/* DETAILS */

.purchase-details{
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
    padding:8px 18px;
    border-radius:30px;
    font-size:13px;
    font-weight:600;
}

.status-approved{
    background:rgba(34,197,94,0.2);
    color:#4ade80;
}

.status-pending{
    background:rgba(245,158,11,0.2);
    color:#facc15;
}

.status-rejected{
    background:rgba(239,68,68,0.2);
    color:#f87171;
}

/* AMOUNT */

.amount-box{
    background:linear-gradient(45deg,#22c55e,#4ade80);
    border-radius:20px;
    padding:20px;
    text-align:center;
    margin-top:20px;
}

.amount-box h2{
    font-size:32px;
    font-weight:700;
    margin:0;
}

.amount-box p{
    margin:0;
    font-size:14px;
}

/* DOWNLOAD */

.download-btn{
    width:100%;
    height:52px;
    border:none;
    border-radius:18px;
    margin-top:20px;
    background:linear-gradient(45deg,#2563eb,#60a5fa);
    color:white;
    font-weight:700;
    transition:0.4s;
}

.download-btn:hover{
    transform:translateY(-5px);
    box-shadow:0 12px 25px rgba(37,99,235,0.4);
}

/* EMPTY */

.empty-card{
    background:rgba(255,255,255,0.08);
    padding:40px;
    border-radius:30px;
    text-align:center;
    color:#dbeafe;
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

        Purchase Menu

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

        <div class="collapse show sub-menu"
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

            Purchase Orders Dashboard

        </h1>

        <p class="hero-text">

            Monitor and manage all purchase orders
            with a modern Vendor Management dashboard.

        </p>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <div class="stats-card">

            <i class="bi bi-box-seam"></i>

            <h2>

                ${purchases.size()}

            </h2>

            <p>Total Purchase Orders</p>

        </div>



    </div>



    <!-- PURCHASE GRID -->

    <div class="purchase-grid"
         id="purchaseGrid">

        <c:forEach var="p"
                   items="${purchases}">

            <!-- PURCHASE CARD -->

            <div class="purchase-card">

                <!-- TOP -->

                <div class="card-top">

                    <div class="card-icon">

                        <i class="bi bi-box-fill"></i>

                    </div>

                    <div>

                        <h3 class="purchase-title">

                            ${p.itemName}

                        </h3>

                        <span class="purchase-id">

                            Purchase ID :
                            #${p.id}

                        </span>

                    </div>

                </div>

                <!-- DETAILS -->

                <div class="purchase-details">

                    <div class="detail-box">

                        <span class="detail-label">

                            Customer Name

                        </span>

                        <span class="detail-value">

                            ${p.customer.customerName}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Product Group

                        </span>

                        <span class="detail-value">

                            ${p.productGroup.productName}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Make & Model

                        </span>

                        <span class="detail-value">

                            ${p.make} - ${p.model}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Quantity

                        </span>

                        <span class="detail-value">

                            ${p.openingBalance}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Due Date

                        </span>

                        <span class="detail-value">

                            ${p.orderDueDate}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Status

                        </span>

                        <c:choose>

                            <c:when test="${p.status == 'APPROVED'}">

                                <span class="status-badge status-approved">

                                    APPROVED

                                </span>

                            </c:when>

                            <c:when test="${p.status == 'PENDING'}">

                                <span class="status-badge status-pending">

                                    PENDING

                                </span>

                            </c:when>

                            <c:otherwise>

                                <span class="status-badge status-rejected">

                                    REJECTED

                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

                <!-- AMOUNT -->

                <div class="amount-box">

                    <p>Purchase Price</p>

                    <h2>

                        ₹ ${p.purchasePrice}

                    </h2>

                </div>

                <!-- DOWNLOAD -->

                <c:if test="${p.status == 'APPROVED'}">

                    <a href="downloadPurchase?id=${p.id}">

                        <button class="download-btn">

                            <i class="bi bi-download"></i>
                            Download Invoice

                        </button>

                    </a>

                </c:if>

            </div>

        </c:forEach>

        <!-- EMPTY -->

        <c:if test="${empty purchases}">

            <div class="empty-card">

                <h3>

                    No Purchase Orders Found

                </h3>

                <p>

                    Purchase records will appear here.

                </p>

            </div>

        </c:if>

    </div>
    <!-- PAGINATION -->

    <div class="d-flex justify-content-center mt-4">

        <nav>

            <ul class="pagination">

                <!-- PREVIOUS -->

                <c:if test="${currentPage > 0}">

                    <li class="page-item">

                        <a class="page-link"
                           href="viewPurchase?page=${currentPage - 1}">

                            Previous

                        </a>

                    </li>

                </c:if>

                <!-- PAGE NUMBERS -->

                <c:forEach begin="0"
                           end="${totalPages - 1}"
                           var="i">

                    <li class="page-item
                        ${currentPage == i ? 'active' : ''}">

                        <a class="page-link"
                           href="viewPurchase?page=${i}">

                            ${i + 1}

                        </a>

                    </li>

                </c:forEach>

                <!-- NEXT -->

                <c:if test="${currentPage < totalPages - 1}">

                    <li class="page-item">

                        <a class="page-link"
                           href="viewPurchase?page=${1}">

                            Next

                        </a>

                    </li>

                </c:if>

            </ul>

        </nav>

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

/* SEARCH */

const searchInput =
    document.getElementById("searchInput");

searchInput.addEventListener("keyup",function(){

    const filter =
        this.value.toLowerCase();

    const cards =
        document.querySelectorAll(".purchase-card");

    cards.forEach(card=>{

        const text =
            card.innerText.toLowerCase();

        if(text.includes(filter)){

            card.style.display = "block";

        }else{

            card.style.display = "none";
        }

    });

});

</script>

<!-- BOOTSTRAP -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>