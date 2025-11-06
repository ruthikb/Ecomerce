<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div class="sidebar border-end">
              <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>
              <ul class="list-unstyled">
                  <li class="mb-2">
                      <a href="" class="d-block py-2 px-3 text-white rounded hover-item">
                          <i class="bi bi-cart me-2"></i> sales
                      </a>
                  </li>
                  <li class="mb-2">
                      <a href="purchase" class="d-block py-2 px-3 text-white rounded hover-item">
                           <i class="bi bi-box me-2"></i> purchase
                      </a>
                  </li>
              </ul>
          </div>
    <main>
    <div class="container mt-5">
        <h2 class="mb-4">Purchase Order Form</h2>
        <form action="purchaseDetails" method="POST">
            <div class="row g-3">
                <!-- Voucher Type -->
                <div class="col-md-6">
                    <label class="form-label">Voucher Type</label>
                    <select class="form-select" name="voucherType" required>
                        <option value="sales">Sales</option>
                        <option value="purchase">Purchase</option>
                    </select>
                </div>

                <!-- Customer Name Dropdown -->
                <div class="col-md-6">
                    <label class="form-label">Customer Name</label>
                    <select class="form-select" name="customerName" required>
                        <option value="">Select Customer</option>

                    </select>
                </div>

                <!-- Product Group Name -->
                <div class="col-md-6">
                    <label class="form-label">Product Group Name</label>
                    <select class="form-select" name="productGroup" required>
                        <option value="">Select Product Group</option>
                        

                    </select>
                </div>

                <!-- Make (Company Name) -->
                <div class="col-md-6">
                    <label class="form-label">Make (Company Name)</label>
                    <input type="text" class="form-control" name="make" required>
                </div>

                <!-- Model -->
                <div class="col-md-6">
                    <label class="form-label">Model</label>
                    <input type="text" class="form-control" name="model" required>
                </div>

                <!-- Product Code -->
                <div class="col-md-6">
                    <label class="form-label">Product Code</label>
                    <input type="text" class="form-control" name="productCode" required>
                </div>

                <!-- Item Name (Auto-generated) -->
                <div class="col-md-6">
                    <label class="form-label">Item Name</label>
                    <input type="text" class="form-control" name="itemName" readonly>
                </div>

                <!-- Opening Value -->
                <div class="col-md-6">
                    <label class="form-label">Opening Value (Initial Price)</label>
                    <input type="number" class="form-control" name="openingValue" value="1000" required>
                </div>

                <!-- Opening Balance -->
                <div class="col-md-6">
                    <label class="form-label">Opening Balance (Stock-in-hand)</label>
                    <input type="number" class="form-control" name="openingBalance" value="5" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Quantity</label>
                    <input type="number" class="form-control" name="quantity" value="1" required>
                </div>

                <!-- Purchase Price -->
                <div class="col-md-6">
                    <label class="form-label">Purchase Price</label>
                    <input type="number" class="form-control" name="purchasePrice" value="1000" required>
                </div>

                <!-- Order Due Date -->
                <div class="col-md-6">
                    <label class="form-label">Order Due Date</label>
                    <input type="date" class="form-control" name="orderDueDate" required>
                </div>



                <!-- Submit Button -->
                <div class="col-12 mt-4">
                    <button type="submit" class="btn btn-primary">Submit Order</button>
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
</body>
</html>