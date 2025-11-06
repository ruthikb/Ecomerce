<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>User Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
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
                   body {
                              margin: 0;
                              font-family: Arial, sans-serif;
                              background-color: #f5f5f5;
                          }

          </style
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
  <div class="container py-4">
    <h3 class="mb-4">User Form</h3>

    <form id="userForm" class="row g-3 needs-validation" novalidate>
      <!-- hidden id -->
      <input type="hidden" id="id" name="id" />

      <div class="col-md-6">
        <label for="firstName" class="form-label">First Name</label>
        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="enter the first name " required />
        <div class="invalid-feedback">First name is required.</div>
      </div>

      <div class="col-md-6">
        <label for="lastName" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="lastName" name="lastName" placeholder="enter the lastName" required />
        <div class="invalid-feedback">Last name is required.</div>
      </div>

      <div class="col-md-6">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required />
        <div class="invalid-feedback">Enter a valid email.</div>
      </div>

      <div class="col-md-6">
        <label for="phone" class="form-label">Phone</label>
        <input type="tel" class="form-control" id="phone" name="phone" placeholder="enter the phoneNo" required />
        <div class="invalid-feedback">Phone number is required.</div>
      </div>

      <div class="col-md-6">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
        <div class="invalid-feedback">Password (min 6 characters) is required.</div>
      </div>

      <div class="col-md-6">
        <label for="role" class="form-label">Role</label>
        <select class="form-select" id="role" name="role" required>
          <option value="">Choose...</option>
          <option value="USER">USER</option>
          <option value="ADMIN">ADMIN</option>
        </select>
        <div class="invalid-feedback">Please select a role.</div>
      </div>

      <!-- <div class="col-md-4">
        <label for="failedAttempts" class="form-label">Failed Attempts</label>
        <input type="number" class="form-control" id="failedAttempts" name="failedAttempts" min="0" value="0" hidden />
      </div> -->

      <div class="col-md-4">
        <label for="lockTime" class="form-label">Lock Time</label>
        <input type="datetime-local" class="form-control" id="lockTime" name="lockTime" />
      </div>

      <!-- <div class="col-md-4">
        <label for="otp" class="form-label">OTP</label>
        <input type="text" class="form-control" id="otp" name="otp" placeholder="One-time code" />
      </div> -->

      <div class="col-12">
        <button class="btn btn-primary" type="submit">update </button>
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
                    document.getElementById("dateTime").textContent = new Date().toLocaleString();
                }
                setInterval(updateDateTime, 1000);
                updateDateTime();



            </script>
l̥
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
