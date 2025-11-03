<%@ page language="java" contentType="text/html;charset=UTF-8"  %>
<%@ page  isELIgnored="false" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin-Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }


        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1050;
        }


        .sidebar {
            position: fixed;
            top: 56px;

            left: 0;
            width: 250px;
            height: calc(100vh - 56px);
            background-color: #000;
            color: white;
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
            margin-top: 70px;
            margin-left: 260px;

            padding: 20px;
            background-color: #fff;
            min-height: calc(100vh - 70px);
        }


        footer {
            background-color: black;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9em;
            z-index: 1050;
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

        body {
            overflow-y: auto;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> Admin Name
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">

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
        <h1>View User</h1>
        <p>List of Users:</p>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${getAllUser}" var="dtoList">
                    <tr>
                        <td>${dtoList.id}</td>
                        <td>${dtoList.firstName}</td>
                        <td>${dtoList.lastName}</td>
                        <td>${dtoList.email}</td>
                        <td>${dtoList.role}</td>
                        <td>
                            <a href="editUser?id=${dtoList.id}" class="bi bi-pencil-square"></a>&nbsp;&nbsp;
                            <a href="deleteUser?id=${dtoList.id}" class="bi bi-trash"></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
      </main>
      <footer>
              <span id="dateTime" class="date-time"></span>
              <p>&copy; 2025 E-commerce Portal | e-Portal</p>
          </footer>

          <script>

              function updateDateTime() {
                  document.getElementById("dateTime").textContent = new Date().toLocaleString();
              }
              setInterval(updateDateTime, 1000);
              updateDateTime();


      
          </script>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>