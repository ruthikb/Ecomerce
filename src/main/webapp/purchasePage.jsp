<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Purchase Order Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Layout / spacing */
        :root {
            --navbar-height: 56px;
            --sidebar-width: 250px;
            --footer-height: 50px;
        }

        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Keep page content clear of the fixed navbar and footer */
        body {
            padding-top: var(--navbar-height);
            padding-bottom: calc(var(--footer-height) + 10px);
        }

        /* Fixed top navbar */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: var(--navbar-height);
            z-index: 1030;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: var(--navbar-height);
            left: 0;
            width: var(--sidebar-width);
            bottom: var(--footer-height);
            background-color: #000;
            color: #fff;
            padding: 15px;
            overflow-y: auto;
        }

        .sidebar a {
            color: #ddd;
            text-decoration: none;

        }
        .sidebar a:hover {
            color: #fff;
            text-decoration: none;
        }

        /* Main content area */
        main {
            margin-left: var(--sidebar-width);
            padding: 20px;
            background-color: #fff;
            min-height: calc(100vh - var(--navbar-height) - var(--footer-height));
        }

        /* Footer */
        footer {
            background-color: #000;
            color: #fff;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: var(--footer-height);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9em;
            z-index: 1030;
        }

        footer .date-time {
            position: absolute;
            right: 20px;
            font-weight: 600;
        }

        footer p {
            margin: 0;
            text-align: center;
        }

        /* Small UI helpers for the collapsible menu (Bootstrap example styles) */
        .btn-toggle {
            display: inline-flex;
            align-items: center;
            padding: .25rem .5rem;
            font-weight: 600;
            color: #ddd;
            background: transparent;
            border: 0;
        }

        .btn-toggle:hover,
        .btn-toggle:focus {
            color: #fff;
            text-decoration: none;
            background-color: rgba(255,255,255,0.03);
        }

        .btn-toggle::after {
            content: '\u25be';
            margin-left: .5rem;
            font-size: .7em;
            transform-origin: .5em .5em;
            transition: transform .2s ease-in-out;
        }

        .btn-toggle[aria-expanded="true"]::after {
            transform: rotate(180deg);
        }

        .btn-toggle-nav a {
            display: block;
            padding: .25rem 0.5rem;
            color: #cfcfcf;
        }

        .btn-toggle-nav a:hover {
            color: #fff;
        }

        /* Responsive: collapse sidebar on small screens */
        @media (max-width: 767.98px) {
            .sidebar {
                position: static;
                width: 100%;
                height: auto;
                bottom: auto;
            }
            main {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topnav"
                aria-controls="topnav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="topnav">
                <!-- optional top nav items -->
            </div>
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

    <main>
    <div class="container mt-5">
        <h2 class="mb-4">Purchase Order Form</h2>
       <form action="savePurchase" method="post" enctype="application/x-www-form-urlencoded">

    <div class="mb-3">
      <label>Voucher Type</label>
      <select name="voucherType" class="form-select">

        <option value="Purchase" selected>Purchase</option>
      </select>
    </div>

  <div class="mb-3">
    <label>Customer Name</label>
    <select name="customerId" class="form-select" required>
      <c:if test="${empty customers}">
        <option disabled>No customers available</option>
      </c:if>

      <c:forEach var="c" items="${customers}">
        <!-- use properties that exist on your Customer object -->
        <option value="${c.id}">${c.customerName}</option>
      </c:forEach>
    </select>
  </div>

  <div class="mb-3">
    <label>Product Group Name</label>
    <select name="productGroupId" class="form-select" required>

      <c:if test="${empty productGroups}">
        <option disabled>No products available</option>
      </c:if>

      <c:forEach var="group" items="${productGroups}">
        <!-- ensure option value is the numeric id and display productName -->
        <option value="${group.id}">${group.productName}</option>
      </c:forEach>
    </select>
  </div>

    <div class="row">
      <div class="col-md-4">
        <label>Make</label>
        <input name="make" class="form-control" required>
      </div>
      <div class="col-md-4">
        <label>Model</label>
        <input name="model" class="form-control" required>
      </div>
      <div class="col-md-4">
        <label>Product Code</label>
        <input name="productCode" class="form-control">
      </div>
    </div>

    <div class="mb-3 mt-3">
      <label>Item Name</label>
      <input name="itemName" class="form-control" required>
    </div>

    <div class="row">
      <div class="col-md-4">
        <label>Opening Value</label>
        <input type="number" name="openingValue" value="1000" class="form-control" required>
      </div>
      <div class="col-md-4">
        <label>Opening Balance</label>
        <input type="number" name="openingBalance" value="5" class="form-control" required>
      </div>
      <div class="col-md-4">
        <label>Purchase Price</label>
        <input type="number" name="purchasePrice" value="1000" class="form-control" required>
      </div>
    </div>

    <!-- ✅ Important fix: ensure correct date format -->
    <div class="mb-3 mt-3">
      <label>Order Due Date</label>
      <input type="date" name="orderDueDate" class="form-control" required
             pattern="\d{4}-\d{2}-\d{2}" placeholder="yyyy-MM-dd">
    </div>

    <!-- Order Button Opens Popup -->
    <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#confirmPopup">Order</button>

    <!-- Popup -->
    <div class="modal fade" id="confirmPopup" tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header"><h5>Confirm Purchase (Pending)</h5></div>
          <div class="modal-body">
            <p><b>Price:</b> <span id="priceDisplay"></span></p>
            <p><b>Quantity:</b> <span id="qtyDisplay"></span></p>
            <p class="text-warning">Status will be <b>PENDING</b></p>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-success">Confirm & Save</button>
            <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>
    </div>
  </form>
    </div>
    </main>
     <footer>
        <span id="dateTime" class="date-time"></span>
        <p>&copy; 2025 E-commerce Portal | e-Portal</p>
    </footer>

    <script>
        function updateDateTime() {
            const el = document.getElementById("dateTime");
            if (el) el.textContent = new Date().toLocaleString();
        }
        setInterval(updateDateTime, 1000);
        updateDateTime();
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-generate item name from make and model
        document.querySelectorAll('input[name="make"], input[name="model"], input[name="productCode"]').forEach(input => {
            input.addEventListener('input', () => {
                const make = document.querySelector('input[name="make"]').value;
                const model = document.querySelector('input[name="model"]').value;
                const productCode = document.querySelector('input[name="productCode"]').value;
                document.querySelector('input[name="itemName"]').value = make + ' ' + model + ' (' + productCode + ')';
            });
        });
    </script>
    <script>
    document.getElementById("confirmPopup").addEventListener("show.bs.modal", function() {
      document.getElementById("priceDisplay").innerText = document.querySelector("[name='purchasePrice']").value;
      document.getElementById("qtyDisplay").innerText = document.querySelector("[name='openingBalance']").value;
    });
    </script>
</body>
</html>