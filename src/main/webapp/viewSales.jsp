<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Sales</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

:root{
    --navbar-height:56px;
    --sidebar-width:250px;
    --footer-height:50px;
}

/* NAVBAR */
.navbar{
    position:fixed;
    top:0;
    width:100%;
    height:var(--navbar-height);
    z-index:1000;
}

/* SIDEBAR */
.sidebar{
    position:fixed;
    top:var(--navbar-height);
    left:0;
    width:var(--sidebar-width);
    bottom:var(--footer-height);
    background:#000;
    padding:20px;
}

.sidebar a{
    color:#ddd;
    text-decoration:none;
}

.sidebar a:hover{
    color:#fff;
}

/* MAIN CONTENT AREA */
.main-content{
    margin-top:var(--navbar-height);
    margin-left:var(--sidebar-width);
    margin-bottom:var(--footer-height);
    padding:30px;
    background:#f5f6fa;
    min-height:calc(100vh - var(--navbar-height) - var(--footer-height));
}

/* TABLE STYLE */
table{
    width:100%;
    border-collapse:collapse;
}

th,td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}

th{
    background:#343a40;
    color:white;
}

/* FOOTER */
footer{
    position:fixed;
    bottom:0;
    width:100%;
    height:var(--footer-height);
    background:black;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
}

footer .date-time{
    position:absolute;
    right:20px;
    font-weight:600;
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

<div class="sidebar border-end bg-dark p-3" style="width: 250px;">
            <h5 class="text-center border-bottom pb-2 mb-3 text-white">Menu</h5>

            <ul class="list-unstyled">

                <!-- SALES -->
                <li class="mb-2">
                    <a class="d-flex justify-content-between align-items-center py-2 px-3 text-white rounded hover-item"
                       data-bs-toggle="collapse" href="#salesMenu" role="button">
                        <span><i class="bi bi-cart me-2"></i> Sales</span>
                        <i class="bi bi-chevron-down"></i>
                    </a>

                    <div class="collapse ps-3 mt-2" id="salesMenu">
                        <ul class="list-unstyled">
                            <li>
                                <a href="addSales" class="d-block py-2 px-3 text-white rounded hover-item">
                                    Add Sales
                                </a>
                            </li>
                            <li>
                                <a href="viewSales" class="d-block py-2 px-3 text-white rounded hover-item">
                                    View Sales
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <!-- PURCHASE -->
                <li class="mb-2">
                    <a class="d-flex justify-content-between align-items-center py-2 px-3 text-white rounded hover-item"
                       data-bs-toggle="collapse" href="#purchaseMenu" role="button">
                        <span><i class="bi bi-box me-2"></i> Purchase</span>
                        <i class="bi bi-chevron-down"></i>
                    </a>

                    <div class="collapse ps-3 mt-2" id="purchaseMenu">
                        <ul class="list-unstyled">
                            <li>
                                <a href="addPurchase" class="d-block py-2 px-3 text-white rounded hover-item">
                                    Add Purchase
                                </a>
                            </li>
                            <li>
                                <a href="viewPurchase" class="d-block py-2 px-3 text-white rounded hover-item">
                                    View Purchase
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>

<!-- MAIN CONTENT -->
<div class="main-content">

<h2 class="text-center mb-4">Sales List</h2>

<table class="table table-bordered table-hover">

<thead>
<tr>
    <th>ID</th>
    <th>Product Group Id</th>
    <th>Brand</th>
    <th>Model</th>
    <th>Selling Price</th>
    <th>Quantity</th>
    <th>Total Amount</th>
</tr>
</thead>

<tbody>

<c:forEach items="${salesList}" var="sale">

<tr>
    <td>${sale.id}</td>
    <td>${sale.productGroupId}</td>
    <td>${sale.brand}</td>
    <td>${sale.model}</td>
    <td>${sale.sellingPrice}</td>
    <td>${sale.quantity}</td>
    <td>${sale.totalAmount}</td>
</tr>

</c:forEach>

</tbody>

</table>

</div>

<!-- FOOTER -->
<footer>

<p>&copy; 2025 E-commerce Portal | e-Portal</p>

<span id="dateTime" class="date-time"></span>

</footer>

<!-- JS -->
<script>

function updateDateTime(){
    document.getElementById("dateTime").textContent =
        new Date().toLocaleString();
}

setInterval(updateDateTime,1000);
updateDateTime();

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>