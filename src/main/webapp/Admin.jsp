<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>User Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
  <div class="container py-4"><!DOCTYPE html>
  <html lang="en">
  <head>
      <%@ page language="java" contentType="text/html;charset=UTF-8"  %>
      <%@ page  isELIgnored="false" %>
      <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>Admin-Page</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

      <style>
        /* Use Bootstrap variables for colors and spacing */
        body {
          margin: 0;
          font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
          background-color: var(--bs-body-bg, #f8f9fa);
        }

        .navbar {
          z-index: 1030; /* ensure above sidebar/content */
        }

        /* Sidebar: compact custom rules, rest rely on Bootstrap utilities in markup */
        .sidebar {
          position: fixed;
          top: 56px; /* height of navbar (default) */
          left: 0;
          width: 250px;
          height: calc(100vh - 56px);
          background-color: var(--bs-dark);
          color: var(--bs-white);
          padding: 1rem;
          overflow-y: auto;
        }

        .sidebar h5 {
          margin: 0 0 0.5rem 0;
          color: var(--bs-white);
        }

        .sidebar .list-unstyled a {
          color: rgba(255,255,255,0.9);
          text-decoration: none;
          display: block;
          padding: 0.5rem 0.75rem;
          border-radius: 0.375rem;
        }

        .sidebar .list-unstyled a:hover,
        .sidebar .list-unstyled a:focus {
          background-color: rgba(255,255,255,0.05);
          color: var(--bs-white);
          text-decoration: none;
        }

        /* Main content adjusted to the width of the sidebar */
        main {
          margin-top: 70px; /* space below navbar */
          margin-left: 270px; /* sidebar width + gap */
          padding: 2rem;
          background-color: var(--bs-white);
          min-height: calc(100vh - 70px - 50px); /* exclude navbar & footer */
          border-radius: 0.25rem;
          box-shadow: 0 0.25rem 0.5rem rgba(0,0,0,0.03);
        }

        /* Make main responsive on small screens: sidebar becomes full-width stacked */
        @media (max-width: 991.98px) {
          .sidebar {
            position: static;
            width: 100%;
            height: auto;
            top: auto;
            left: auto;
            display: block;
          }
          main {
            margin-left: 0;
            margin-top: 1rem;
            padding: 1rem;
          }
        }

        /* Footer: fixed-bottom with centered content; date-time positioned to the right */
        footer {
          background-color: var(--bs-dark);
          color: var(--bs-white);
          position: fixed;
          bottom: 0;
          left: 0;
          width: 100%;
          height: 50px;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 0.9rem;
          z-index: 1030;
          padding: 0 1rem;
        }

        footer .date-time {
          position: absolute;
          right: 1rem;
          font-weight: 600;
        }

        footer p {
          margin: 0;
          text-align: center;
        }

        /* Small utility tweaks */
        .hover-item { transition: background-color .15s ease, transform .06s ease; }
        .hover-item:active { transform: translateY(1px); }
      </style>
  </head>
  <body>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
          <div class="container-fluid">
              <a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbarContent" aria-controls="navbarContent"
                  aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
                  <ul class="navbar-nav mb-2 mb-lg-0">
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="getAdminName" id="firstName" role="button"
                             data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi bi-person-circle"></i> ${userDto.firstName()}
                          </a>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="firstName">
                              <li><a class="dropdown-item" href="logOut">Log-Out</a></li>
                          </ul>
                      </li>
                  </ul>
              </div>
          </div>
      </nav>

      <div class="sidebar border-end">
          <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>
          <ul class="list-unstyled">
              <li class="mb-2">
                  <a href="addCustomerPage" class="d-block py-2 px-3 text-white rounded hover-item">
                      <i class="bi bi-person-plus me-2"></i> Add Customer
                  </a>
              </li>
              <li class="mb-2">
                  <a href="getAllCustomers" class="d-block py-2 px-3 text-white rounded hover-item">
                      <i class="bi bi-people me-2"></i> View Customers
                  </a>
              </li>
              <li class="mb-2">
                 <a href="viewUser" class="d-block py-2 px-3 text-white rounded hover-item">
                     <i class="bi bi-people me-2"></i> View User
                 </a>
              </li>
          </ul>
      </div>

      <main>
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12">
                      <h2 class="mb-3">Welcome, Admin!</h2>
                      <p class="text-muted mb-4">This is your admin dashboard where you can manage users, products, and orders.</p>
                  </div>
              </div>
              </div>
      </main>

  <script>
    // Bootstrap validation helper
    (function () {
      'use strict'
      const forms = document.querySelectorAll('.needs-validation')
      Array.from(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
    })()
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>