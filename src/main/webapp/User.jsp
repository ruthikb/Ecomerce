<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin-Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

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

    <div class="sidebar" role="navigation" aria-label="Sidebar menu">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
            <svg class="bi pe-none me-2" width="30" height="24" aria-hidden="true">
                <use xlink:href="#bootstrap"></use>
            </svg>
            <span class="fs-5 fw-semibold">Collapsible</span>
        </a>

        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                    Order
                </button>
                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sales</a></li>
                        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Purchase</a></li>
                    </ul>
                </div>
            </li>


    <main>
        <h2>Welcome, users</h2>
        <p>This is your user dashboard where you can view and manage your account details.</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>