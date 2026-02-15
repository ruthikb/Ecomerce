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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
                    rel="stylesheet">

                <style>
                    :root {
                        --navbar-height: 56px;
                        --sidebar-width: 250px;
                        --footer-height: 50px;
                    }

                    html,
                    body {
                        height: 100%;
                        margin: 0;
                        font-family: Arial, sans-serif;
                        background: linear-gradient(to right, #f8f9fa, #eef2f7);
                    }

                    body {
                        padding-top: var(--navbar-height);
                        padding-bottom: var(--footer-height);
                    }

                    /* Navbar */
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

                    /* Main */
                    main {
                        margin-left: var(--sidebar-width);
                        padding: 30px;
                        min-height: calc(100vh - var(--navbar-height) - var(--footer-height));
                    }

                    /* Footer */
                    footer {
                        position: fixed;
                        bottom: 0;
                        left: 0;
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
                        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
                        max-width: 1000px;
                        margin: auto;
                        border: 1px solid #e9ecef;
                    }

                    .form-section h3 {
                        font-size: 26px;
                        letter-spacing: 1px;
                        color: #0056B3;
                    }

                    .form-section label {
                        font-weight: 600;
                        font-size: 14px;
                        margin-bottom: 6px;
                    }

                    .form-section .form-control {
                        height: 45px;
                        border-radius: 8px;
                        border: 1px solid #ced4da;
                        transition: 0.3s ease;
                    }

                    .form-section .form-control:focus {
                        border-color: #0056B3;
                        box-shadow: 0 0 0 0.2rem rgba(0, 86, 179, 0.15);
                    }

                    .form-section input[readonly] {
                        background-color: #f1f3f5;
                    }

                    /* Submit Button */
                    .btn-submit {
                        background: linear-gradient(135deg, #0056B3, #007bff);
                        color: #fff;
                        border: none;
                        padding: 12px 40px;
                        font-weight: 600;
                        border-radius: 8px;
                        transition: 0.3s ease;
                    }

                    .btn-submit:hover {
                        background: linear-gradient(135deg, #003f8a, #0056B3);
                        transform: translateY(-2px);
                        box-shadow: 0 6px 18px rgba(0, 86, 179, 0.35);
                    }

                    /* Responsive */
                    @media (max-width: 768px) {
                        .sidebar {
                            position: static;
                            width: 100%;
                            height: auto;
                        }

                        main {
                            margin-left: 0;
                        }
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

                    <a class="d-block py-2 mt-2" data-bs-toggle="collapse" href="#purchaseMenu">
                        <i class="bi bi-box me-2"></i> Purchase
                    </a>
                    <div class="collapse ps-3" id="purchaseMenu">
                        <a href="addPurchase" class="d-block py-1">Add Purchase</a>
                        <a href="viewPurchase" class="d-block py-1">View Purchase</a>
                    </div>
                </div>

                <!-- MAIN -->
                <main>

                    <div class="form-section">
                        <h3 class="text-center fw-bold mb-4">Create Sales Order</h3>

                        <form action="saveSalesOrder" method="post">

                            <div class="row g-4">

                                <div class="col-md-6">
                                    <label>Customer Name</label>
                                    <select name="customerName" required class="form-control">
                                        <option value="">-- Select Customer --</option>
                                        <c:forEach var="customer" items="${debitors}">
                                            <option value="${customer.customerName}">
                                                ${customer.customerName}
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <label class="mt-3">Product Name</label>
                                    <select name="productName" required class="form-control">
                                        <option value="">-- Select Product --</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.productGroup}">
                                                ${product.productGroup}
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <label class="mt-3">Email</label>
                                    <input type="email" name="email" class="form-control" required>

                                    <label class="mt-3">Brand</label>
                                    <input type="text" name="brand" class="form-control" required>

                                    <label class="mt-3">Model</label>
                                    <input type="text" name="model" class="form-control" required>
                                </div>

                                <div class="col-md-6">
                                    <label>Selling Price</label>
                                    <input type="number" id="price" name="sellingPrice" step="0.01" class="form-control"
                                        required>

                                    <label class="mt-3">Quantity</label>
                                    <input type="number" id="qty" name="quantity" min="1" value="1" class="form-control"
                                        required>

                                    <label class="mt-3">Total Amount</label>
                                    <input type="number" id="total" name="totalAmount" step="0.01" class="form-control"
                                        readonly>

                                    <label class="mt-3">Sales Date</label>
                                    <input type="date" name="salesDate" class="form-control" required>
                                </div>
                            </div>
                            <center>
                                <button type="submit" class="btn-submit mt-4">Submit</button>
                            </center>
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
                    /* Live Date & Time */
                    function updateDateTime() {
                        document.getElementById("dateTime").textContent =
                            new Date().toLocaleString();
                    }
                    setInterval(updateDateTime, 1000);
                    updateDateTime();

                    /* Auto Calculate Total */
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
                </script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>