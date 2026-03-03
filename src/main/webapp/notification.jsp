<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Admin-Page</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

body {
    margin: 0;
    background-color: #f4f6f9;
}


.navbar {
    height: 56px;
}


.sidebar {
    position: fixed;
    top: 56px;
    left: 0;
    width: 250px;
    height: calc(100vh - 56px);
    background-color: #212529;
    padding: 20px 15px;
    overflow-y: auto;
}

.sidebar h5 {
    color: #fff;
}

.sidebar a {
    display: block;
    color: #ddd;
    padding: 8px 12px;
    margin-bottom: 5px;
    border-radius: 5px;
    text-decoration: none;
}

.sidebar a:hover {
    background-color: #343a40;
    color: #fff;
}

/* ========== MAIN CONTENT ========== */
.main-content {
    margin-top: 70px;
    margin-left: 260px;
    padding: 25px;
    padding-bottom: 100px; /* prevents footer overlap */
}

/* ========== TABLE STYLING ========== */
.table thead {
    background-color: #212529;
    color: white;
}

.table {
    background-color: white;
}

/* ========== FOOTER ========== */
footer {
    background-color: #000;
    color: white;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
}

footer .date-time {
    position: absolute;
    right: 20px;
    font-weight: 600;
}

footer p {
    margin: 0;
}

/* ========== RESPONSIVE ========== */
@media (max-width: 991px) {

    .sidebar {
        position: static;
        width: 100%;
        height: auto;
    }

    .main-content {
        margin-left: 0;
        margin-top: 20px;
    }
}

</style>
</head>

<body>

<!-- ========== NAVBAR ========== -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">

        <a class="navbar-brand" href="Admin.jsp">
            E-Commerce Portal
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
            <ul class="navbar-nav align-items-center">

                <li class="nav-item me-3">
                    <a href="notification" class="nav-link">
                        <i class="bi bi-bell fs-5"></i>
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#"
                       role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle"></i>
                        ${userDto.firstName()}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="logOut">Log-Out</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>

    </div>
</nav>

<!-- ========== SIDEBAR ========== -->
<div class="sidebar">
    <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>

    <a href="addCustomerPage">
        <i class="bi bi-person-plus me-2"></i> Add Customer
    </a>

    <a href="getAllCustomers">
        <i class="bi bi-people me-2"></i> View Customers
    </a>

    <a href="viewUser">
        <i class="bi bi-person me-2"></i> View User
    </a>
</div>

<!-- ========== MAIN CONTENT ========== -->
<div class="main-content">

    <h4 class="mb-4">Pending Purchase Requests</h4>

    <div class="table-responsive">
        <table class="table table-bordered align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Product</th>
                    <th>Model</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${pendingOrders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.customer.customerName}</td>
                    <td>${order.itemName}</td>
                    <td>${order.model}</td>
                    <td>${order.purchasePrice}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 'APPROVED'}">
                                <span class="badge bg-success">Approved</span>
                            </c:when>
                            <c:when test="${order.status == 'REJECTED'}">
                                <span class="badge bg-danger">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-warning text-dark">Pending</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="approved" method="post" class="d-inline">
                            <input type="hidden" name="id" value="${order.id}" />
                            <button type="submit" class="btn btn-success btn-sm">Approve</button>
                        </form>
                        <form action="rejected" method="post" class="d-inline">
                            <input type="hidden" name="id" value="${order.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<!-- ========== FOOTER ========== -->
<footer>
    <span id="dateTime" class="date-time"></span>
    <p>&copy; 2025 eCommerce Portal | e-portal</p>
</footer>

<script>
function updateDateTime() {
    document.getElementById("dateTime").textContent =
        new Date().toLocaleString();
}
setInterval(updateDateTime, 1000);
updateDateTime();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>