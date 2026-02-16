<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin - Sales</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        :root {
            --navbar-height: 56px;
            --sidebar-width: 250px;
            --footer-height: 50px;
        }

        body {
            padding-top: var(--navbar-height);
            padding-bottom: var(--footer-height);
            background: linear-gradient(to right, #f8f9fa, #eef2f7);
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            height: var(--navbar-height);
            z-index: 1030;
        }

        .sidebar {
            position: fixed;
            top: var(--navbar-height);
            left: 0;
            width: var(--sidebar-width);
            bottom: var(--footer-height);
            background-color: #000;
            padding: 15px;
            overflow-y: auto;
        }

        .sidebar a {
            color: #ddd;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: #fff;
        }

        main {
            margin-left: var(--sidebar-width);
            padding: 30px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: var(--footer-height);
            background: #000;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        footer .date-time {
            position: absolute;
            right: 20px;
            font-weight: 600;
        }

        .form-section {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
            max-width: 1000px;
            margin: auto;
        }

        .btn-submit {
            background: linear-gradient(135deg, #0056B3, #007bff);
            color: #fff;
            padding: 12px 40px;
            border-radius: 8px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">E-Commerce Portal</a>
    </div>
</nav>

<!-- SIDEBAR -->
<div class="sidebar text-white">
    <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>

    <a class="d-block py-2" data-bs-toggle="collapse" href="#salesMenu">
        <i class="bi bi-cart me-2"></i> Sales
    </a>
    <div class="collapse ps-3" id="salesMenu">
        <a href="addSales" class="d-block py-1">Add Sales</a>
        <a href="viewSales" class="d-block py-1">View Sales</a>
    </div>
</div>

<!-- MAIN -->
<main>
    <div class="form-section">
        <h3 class="text-center fw-bold mb-4">Create Sales Order</h3>

        <form action="saveSalesOrder" method="post">

            <div class="mb-3">
                <label>Voucher Type</label>
                <select name="voucherType" class="form-select">
                    <option value="Sales" selected>Sales</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Customer Name</label>
                <select name="customerId" class="form-select" required>
                    <c:forEach var="c" items="${customers}">
                        <option value="${c.id}">${c.customerName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label>Product Group Name</label>
                <select name="productGroupId" class="form-select" required>
                    <c:forEach var="group" items="${productGroups}">
                        <option value="${group.id}">${group.productName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <label>Email</label>
                    <input name="email" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label>Brand</label>
                    <input name="brand" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label>Model</label>
                    <input name="model" class="form-control">
                </div>
            </div>

            <div class="mt-3">
                <label>Selling Price</label>
                <input type="number" step="0.01" id="price" name="sellingPrice" class="form-control" required>
            </div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <label>Quantity</label>
                    <input type="number" id="qty" name="quantity" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label>Total Amount</label>
                    <input type="number" id="total" name="totalAmount" class="form-control" readonly>
                </div>
                <div class="col-md-4">
                    <label>Sales Date</label>
                    <input type="date" name="salesDate" class="form-control" required>
                </div>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-submit w-100">Order</button>
            </div>

        </form>
    </div>
</main>

<!-- FOOTER -->
<footer>
    <span id="dateTime" class="date-time"></span>
    <p>&copy; 2025 E-commerce Portal | e-Portal</p>
</footer>

<!-- JAVASCRIPT -->
<script>
document.addEventListener("DOMContentLoaded", function () {

    // Live Date & Time
    function updateDateTime() {
        document.getElementById("dateTime").textContent =
            new Date().toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();

    // Auto Calculate Total
    const price = document.getElementById("price");
    const qty = document.getElementById("qty");
    const total = document.getElementById("total");

    function calculateTotal() {
        const p = parseFloat(price.value) || 0;
        const q = parseInt(qty.value) || 0;
        total.value = (p * q).toFixed(2);
    }

    price.addEventListener("input", calculateTotal);
    qty.addEventListener("input", calculateTotal);
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
