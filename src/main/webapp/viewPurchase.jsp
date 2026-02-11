<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>All Purchase Orders</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
:root{
    --navbar-height:60px;
    --sidebar-width:220px;
    --footer-height:40px;
}

/* Body */
body{
    margin:0;
    background:#f8f9fa;
}

/* Navbar */
.navbar{
    height:var(--navbar-height);
    position:fixed;
    top:0;
    left:0;
    right:0;
    z-index:1000;
}

/* Sidebar */
.sidebar{
    position:fixed;
    top:var(--navbar-height);
    left:0;
    width:var(--sidebar-width);
    bottom:var(--footer-height);
    background:#000;
    padding:15px;
    overflow-y:auto;
}

/* Main Content */
.main-content{
    margin-top:var(--navbar-height);
    margin-left:var(--sidebar-width);
    margin-bottom:var(--footer-height);
    padding:30px;
    min-height:calc(100vh - var(--navbar-height) - var(--footer-height));
    display:flex;
    justify-content:center;
    align-items:flex-start;
}

/* Center Card */
.content-card{
    width:100%;
    max-width:1200px;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 4px 20px rgba(0,0,0,0.08);
}

/* Status colors */
.status-pending{color:#ffc107;font-weight:600;}
.status-approved{color:#198754;font-weight:600;}
.status-rejected{color:#dc3545;font-weight:600;}

.table th, .table td{
    text-align:center;
    vertical-align:middle;
}

/* Footer */
footer{
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
    height:var(--footer-height);
    background:#000;
    color:#fff;
    display:flex;
    align-items:center;
    justify-content:center;
}

footer .date-time{
    position:absolute;
    right:20px;
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

<<div class="sidebar border-end bg-dark p-3" style="width: 250px;">
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

    <div class="content-card">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-primary">Purchase Orders</h3>
            <a href="addPurchase" class="btn btn-success">New Purchase</a>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                <tr>
                    <th>SL No</th>
                    <th>Voucher Type</th>
                    <th>Customer</th>
                    <th>Product Group</th>
                    <th>Item</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Due Date</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="p" items="${purchases}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.voucherType}</td>
                        <td>${p.customer.customerName}</td>
                        <td>${p.productGroup.productName}</td>
                        <td>${p.itemName}</td>
                        <td>${p.make}</td>
                        <td>${p.model}</td>
                        <td>₹ ${p.purchasePrice}</td>
                        <td>${p.openingBalance}</td>
                        <td>${p.orderDueDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.status == 'APPROVED'}">
                                    <span class="status-approved">${p.status}</span>
                                </c:when>
                                <c:when test="${p.status == 'PENDING'}">
                                    <span class="status-pending">${p.status}</span>
                                </c:when>
                                <c:when test="${p.status == 'REJECTED'}">
                                    <span class="status-rejected">${p.status}</span>
                                </c:when>
                                <c:otherwise>
                                    ${p.status}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty purchases}">
                    <tr>
                        <td colspan="11" class="text-center text-muted">
                            No purchase records found.
                        </td>
                    </tr>
                </c:if>

                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer>
    <span id="dateTime" class="date-time"></span>
    <p>&copy; 2025 E-commerce Portal | e-Portal</p>
</footer>

<script>
function updateDateTime(){
    document.getElementById("dateTime").textContent =
        new Date().toLocaleString();
}
setInterval(updateDateTime,1000);
updateDateTime();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
