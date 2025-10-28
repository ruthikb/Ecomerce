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
            text-align: center;
        }

    </style>
</head>

<body>
        <header>
            <h1>Ecommerce Portal</h1>
        </header>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-sm border-0 rounded-4">
                    <div class="card-body p-4">
                        <h3 class="text-center mb-4">Reset Password</h3>
                        <form action="sendOtp" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label fw-bold">Enter Email:</label>
                                <input type="email" id="email" name="email" value="${email}" class="form-control"
                                    placeholder="example@gmail.com" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">SendOtp</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card shadow-sm border-0 rounded-4 mt-4">
                    <div class="card-body p-4">
                        <form action="verifyOtp" method="post">
                            <div class="mb-3">
                                <input type="email" id="email" name="email" value="${email}" class="form-control"
                                    placeholder="example@gmail.com" required hidden>
                            </div>
                            <div class="mb-3">
                                <label for="otp" class="form-label fw-bold">Enter OTP:</label>
                                <input type="text" id="otp" name="otp" class="form-control"
                                    placeholder="Enter OTP again" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Verify OTP</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <footer>
            <span id="dateTime" class="date-time"></span>
            <p>&copy; 2025 ecomerce portal | e-portal</p>
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