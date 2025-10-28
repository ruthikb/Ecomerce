<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page  isELIgnored="false" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Reset Password - Ecommerce Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      padding-top: 100px;
      padding-bottom: 80px;
    }

    header {
      background-color: #000;
      color: white;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 70px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 40px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
      z-index: 1000;
    }

    header h1 {
      font-size: 1.6em;
      cursor: pointer;
    }

    footer {
      background-color: black;
      color: white;
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 60px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 0.9em;
      padding: 0 20px;
    }

    footer .date-time {
      position: absolute;
      right: 20px;
      font-weight: 600;
    }

    footer p {
      margin: 0;
    }

    .card {
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 25px;
    }

    .form-label {
      font-weight: 600;
    }
  </style>
</head>

<body>
  <header>
    <h1>Ecommerce Portal</h1>
  </header>

  <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
    <div class="col-md-6 col-lg-4">
      <div class="card">
        <center>
        <h3 class="text-danger mb-4">Reset Password</h3>
        </center>
        <form action="resetPassword" method="post">
          <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="Enter your email" required>
          </div>
          <div class="mb-3">
            <label for="newPassword" class="form-label">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password" required>
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-enter new password" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Reset Password</button>
        </form>
      </div>
    </div>
  </div>

  <footer>
    <span id="dateTime" class="date-time"></span>
    <p>&copy; 2025 Ecommerce Portal | e-portal</p>
  </footer>
  <script>
    function updateDateTime() {
      document.getElementById("dateTime").textContent = new Date().toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
