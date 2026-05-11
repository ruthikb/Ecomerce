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

    <title>View Customers</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- BOOTSTRAP ICONS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        :root{
            --primary:#0f172a;
            --secondary:#1e293b;
            --accent:#2563eb;
            --danger:#ef4444;
            --success:#22c55e;
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
            height:calc(100vh - 100px);
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:25px;
            padding:25px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
        }

        .sidebar-title{
            text-align:center;
            font-size:24px;
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

        /* PAGE HEADER */

        .page-header{
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:30px;
            padding:35px;
            margin-bottom:30px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
            animation:fadeIn 1s ease;
        }

        .page-header h1{
            font-size:42px;
            font-weight:700;
            margin-bottom:10px;
        }

        .page-header p{
            color:#dbeafe;
            font-size:16px;
        }

        /* CUSTOMER GRID */

        .customer-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
            gap:25px;
        }

        /* CUSTOMER CARD */

        .customer-card{
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:30px;
            padding:25px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 25px rgba(0,0,0,0.25);
            transition:0.4s;
            animation:fadeIn 1s ease;
        }

        .customer-card:hover{
            transform:translateY(-10px) scale(1.02);
            box-shadow:0 15px 35px rgba(0,0,0,0.35);
        }

        /* TOP */

        .customer-top{
            display:flex;
            align-items:center;
            gap:18px;
            margin-bottom:25px;
        }

        /* AVATAR */

        .customer-avatar{
            width:70px;
            height:70px;
            border-radius:50%;
            background: linear-gradient(45deg,#2563eb,#60a5fa);
            display:flex;
            justify-content:center;
            align-items:center;
            font-size:30px;
            color:white;
            box-shadow:0 8px 20px rgba(96,165,250,0.4);
        }

        /* NAME */

        .customer-name{
            font-size:24px;
            font-weight:700;
            margin-bottom:5px;
            color:white;
        }

        .customer-id{
            color:#93c5fd;
            font-size:14px;
        }

        /* DETAILS */

        .customer-details{
            display:flex;
            flex-direction:column;
            gap:18px;
        }

        .detail-box{
            background: rgba(255,255,255,0.06);
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
            word-break:break-word;
        }

        /* BADGE */

        .customer-badge{
            padding:8px 14px;
            border-radius:30px;
            font-size:13px;
            font-weight:600;
            display:inline-block;
        }

        .creditor{
            background:#22c55e33;
            color:#4ade80;
        }

        .debtor{
            background:#ef444433;
            color:#f87171;
        }

        /* ACTIONS */

        .card-actions{
            display:flex;
            gap:15px;
            margin-top:25px;
        }

        .action-btn{
            flex:1;
            height:48px;
            border-radius:15px;
            display:flex;
            justify-content:center;
            align-items:center;
            gap:8px;
            text-decoration:none;
            color:white;
            font-weight:600;
            transition:0.3s;
        }

        .edit-btn{
            background: linear-gradient(45deg,#2563eb,#60a5fa);
        }

        .delete-btn{
            background: linear-gradient(45deg,#dc2626,#f87171);
        }

        .action-btn:hover{
            transform:translateY(-4px);
            color:white;
            box-shadow:0 10px 20px rgba(0,0,0,0.3);
        }

        /* PAGINATION */

        .pagination-container{
            margin-top:40px;
            display:flex;
            justify-content:center;
            flex-wrap:wrap;
            gap:12px;
        }

        .page-btn{
            min-width:45px;
            height:45px;
            display:flex;
            justify-content:center;
            align-items:center;
            border-radius:12px;
            background: rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.1);
            color:white;
            text-decoration:none;
            transition:0.3s;
            font-weight:600;
        }

        .page-btn:hover{
            background:#2563eb;
            transform:translateY(-3px);
            color:white;
        }

        .active-page{
            background: linear-gradient(45deg,#2563eb,#60a5fa);
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

        footer p{
            margin:0;
        }

        .date-time{
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

            .page-header h1{
                font-size:30px;
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

                        <i class="bi bi-bell-fill fs-5"></i>

                    </a>

                </li>

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

    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>

            View Customers

        </h1>

        <p>

            Manage and monitor all registered customers
            in the Vendor Management System.

        </p>

    </div>

    <!-- CUSTOMER GRID -->

    <div class="customer-grid">

        <c:forEach items="${listOfCustomers}"
                   var="dtoList">

            <!-- CARD -->

            <div class="customer-card">

                <!-- TOP -->

                <div class="customer-top">

                    <div class="customer-avatar">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <div>

                        <h3 class="customer-name">

                            ${dtoList.getCustomerName()}

                        </h3>

                        <span class="customer-id">

                            Customer ID :
                            #${dtoList.getId()}

                        </span>

                    </div>

                </div>

                <!-- DETAILS -->

                <div class="customer-details">

                    <div class="detail-box">

                        <span class="detail-label">

                            Customer Type

                        </span>

                        <span class="customer-badge
                        ${dtoList.getCustomerType() == 'creditor'
                        ? 'creditor'
                        : 'debtor'}">

                            ${dtoList.getCustomerType()}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Email

                        </span>

                        <span class="detail-value">

                            ${dtoList.getEmail()}

                        </span>

                    </div>

                    <div class="detail-box">

                        <span class="detail-label">

                            Phone

                        </span>

                        <span class="detail-value">

                            ${dtoList.getContactNumber()}

                        </span>

                    </div>

                </div>

                <!-- ACTIONS -->

                <div class="card-actions">

                    <a href="getCustomer?id=${dtoList.getId()}"
                       class="action-btn edit-btn">

                        <i class="bi bi-pencil-square"></i>
                        Edit

                    </a>

                    <a href="deleteCustomer?id=${dtoList.getId()}"
                       class="action-btn delete-btn">

                        <i class="bi bi-trash"></i>
                        Delete

                    </a>

                </div>

            </div>

        </c:forEach>

    </div>

    <!-- PAGINATION -->

    <div class="pagination-container">

        <!-- PREVIOUS -->

        <c:if test="${currentPage > 1}">

            <a href="getAllCustomers?page=${currentPage - 1}&size=${pageSize}"
               class="page-btn">

                <i class="bi bi-chevron-left"></i>

            </a>

        </c:if>

        <!-- PAGE NUMBER -->

        <c:forEach begin="1"
                   end="${totalPages}"
                   var="pageNum">

            <c:choose>

                <c:when test="${pageNum == currentPage}">

                    <span class="page-btn active-page">

                        ${pageNum}

                    </span>

                </c:when>

                <c:otherwise>

                    <a href="getAllCustomers?page=${pageNum}&size=${pageSize}"
                       class="page-btn">

                        ${pageNum}

                    </a>

                </c:otherwise>

            </c:choose>

        </c:forEach>

        <!-- NEXT -->

        <c:if test="${currentPage < totalPages}">

            <a href="getAllCustomers?page=${currentPage + 1}&size=${pageSize}"
               class="page-btn">

                <i class="bi bi-chevron-right"></i>

            </a>

        </c:if>

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