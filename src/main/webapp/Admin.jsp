<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin-Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
        }

        .sidebar {
            position: fixed;
            top: 56px;
            left: 0;
            width: 250px;
            height: calc(100vh - 56px);
            background-color: #212529;
            color: white;
            padding: 1rem;
            overflow-y: auto;
        }

        main {
            margin-top: 70px;
            margin-left: 270px;
            padding: 2rem;
            background-color: white;
            min-height: calc(100vh - 70px);
        }

        @media (max-width: 991px) {
            .sidebar {
                position: static;
                width: 100%;
                height: auto;
            }
            main {
                margin-left: 0;
                margin-top: 1rem;
            }
        }
    </style>
</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">

        <a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
            <ul class="navbar-nav align-items-center">


                <!-- 👤 Admin Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="adminDropdown"
                       role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle"></i> ${userDto.firstName()}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="logOut">Log-Out</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ================= SIDEBAR ================= -->
<div class="sidebar">
    <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>
    <ul class="list-unstyled">

        <li class="mb-2">
            <a href="addCustomerPage" class="text-white text-decoration-none">
                <i class="bi bi-person-plus me-2"></i> Add Customer
            </a>
        </li>

        <li class="mb-2">
            <a href="getAllCustomers" class="text-white text-decoration-none">
                <i class="bi bi-people me-2"></i> View Customers
            </a>
        </li>

        <li class="mb-2">
            <a href="viewUser" class="text-white text-decoration-none">
                <i class="bi bi-person me-2"></i> View User
            </a>
        </li>

        <li class="mb-2">
            <a href="notification" class="text-white text-decoration-none">
                <i class="bi bi-bell me-2"></i> Notification
            </a>
        </li>

    </ul>
</div>

<!-- ================= MAIN CONTENT ================= -->
<main>
    <h2>Welcome, Admin!</h2>
    <p class="text-muted">
        This is your admin dashboard where you can manage users, products, and orders.
    </p>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
