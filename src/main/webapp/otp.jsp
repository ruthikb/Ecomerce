<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>Reset Password | Vendor Management System</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- FONT AWESOME -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        :root{
            --primary:#0f172a;
            --secondary:#1e293b;
            --accent:#2563eb;
            --light:#f8fafc;
            --text:#ffffff;
        }

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            min-height:100vh;
            overflow-x:hidden;
            background: linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
            position:relative;
            padding-top:110px;
            padding-bottom:100px;
        }

        /* BACKGROUND EFFECT */

        body::before{
            content:'';
            position:absolute;
            width:500px;
            height:500px;
            background:rgba(255,255,255,0.08);
            border-radius:50%;
            top:-150px;
            left:-150px;
            filter:blur(10px);
        }

        body::after{
            content:'';
            position:absolute;
            width:400px;
            height:400px;
            background:rgba(255,255,255,0.05);
            border-radius:50%;
            bottom:-100px;
            right:-100px;
            filter:blur(10px);
        }

        /* HEADER */

        header{
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:75px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:0 40px;
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.1);
            z-index:1000;
        }

        .logo{
            color:white;
            font-size:28px;
            font-weight:700;
            letter-spacing:1px;
        }

        .back-btn{
            border:none;
            padding:12px 25px;
            border-radius:30px;
            background:linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-weight:600;
            transition:0.4s;
        }

        .back-btn:hover{
            transform:translateY(-3px);
            box-shadow:0 8px 20px rgba(96,165,250,0.4);
        }

        /* CONTAINER */

        .main-container{
            position:relative;
            z-index:2;
        }

        /* CARD */

        .custom-card{
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(15px);
            border:1px solid rgba(255,255,255,0.1);
            border-radius:25px;
            padding:35px;
            box-shadow:0 10px 35px rgba(0,0,0,0.3);
            animation:fadeIn 1s ease;
        }

        .card-title{
            text-align:center;
            color:white;
            font-weight:700;
            margin-bottom:25px;
        }

        /* ICON */

        .icon-box{
            width:90px;
            height:90px;
            border-radius:50%;
            background:linear-gradient(45deg,#2563eb,#60a5fa);
            display:flex;
            justify-content:center;
            align-items:center;
            margin:0 auto 25px;
            box-shadow:0 10px 25px rgba(37,99,235,0.4);
        }

        .icon-box i{
            color:white;
            font-size:38px;
        }

        /* INPUT */

        .form-label{
            color:white;
            font-weight:500;
            margin-bottom:8px;
        }

        .form-control{
            height:52px;
            border:none;
            border-radius:15px;
            background: rgba(255,255,255,0.15);
            color:white;
            padding-left:15px;
            transition:0.3s;
        }

        .form-control::placeholder{
            color:#dbeafe;
        }

        .form-control:focus{
            background: rgba(255,255,255,0.2);
            box-shadow:none;
            border:1px solid #60a5fa;
            color:white;
        }

        /* BUTTONS */

        .send-btn{
            width:100%;
            height:50px;
            border:none;
            border-radius:15px;
            background: linear-gradient(45deg,#16a34a,#4ade80);
            color:white;
            font-size:17px;
            font-weight:600;
            transition:0.4s;
        }

        .send-btn:hover{
            transform:translateY(-3px);
            box-shadow:0 10px 20px rgba(74,222,128,0.4);
        }

        .verify-btn{
            width:100%;
            height:50px;
            border:none;
            border-radius:15px;
            background: linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-size:17px;
            font-weight:600;
            transition:0.4s;
        }

        .verify-btn:hover{
            transform:translateY(-3px);
            box-shadow:0 10px 20px rgba(96,165,250,0.4);
        }

        /* DIVIDER */

        .divider{
            text-align:center;
            color:#dbeafe;
            margin:30px 0;
            position:relative;
        }

        .divider::before,
        .divider::after{
            content:'';
            position:absolute;
            top:50%;
            width:40%;
            height:1px;
            background:rgba(255,255,255,0.2);
        }

        .divider::before{
            left:0;
        }

        .divider::after{
            right:0;
        }

        /* FOOTER */

        footer{
            position:fixed;
            bottom:0;
            left:0;
            width:100%;
            height:60px;
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
            border-top:1px solid rgba(255,255,255,0.1);
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
            z-index:1000;
        }

        .date-time{
            position:absolute;
            right:20px;
            color:#93c5fd;
            font-weight:600;
        }

        footer p{
            margin:0;
        }

        /* ANIMATION */

        @keyframes fadeIn{

            from{
                opacity:0;
                transform:translateY(30px);
            }

            to{
                opacity:1;
                transform:translateY(0);
            }
        }

        /* RESPONSIVE */

        @media(max-width:768px){

            header{
                padding:0 20px;
            }

            .logo{
                font-size:20px;
            }

            .custom-card{
                padding:25px;
            }

            .date-time{
                display:none;
            }
        }

    </style>

</head>

<body>

<!-- HEADER -->

<header>

    <div class="logo">
        <i class="fa-solid fa-laptop"></i>
        Vendor System
    </div>

    <button class="back-btn"
            onclick="window.location.href='loginPage'">

        <i class="fa-solid fa-arrow-left"></i>
        Back

    </button>

</header>

<!-- MAIN -->

<div class="container main-container">

    <div class="row justify-content-center">

        <div class="col-md-6 col-lg-5">

            <!-- CARD -->

            <div class="custom-card">

                <!-- ICON -->

                <div class="icon-box">

                    <i class="fa-solid fa-lock"></i>

                </div>

                <!-- TITLE -->

                <h2 class="card-title">

                    Reset Password

                </h2>

                <!-- SEND OTP FORM -->

                <form action="sendOtp" method="post">

                    <div class="mb-4">

                        <label for="email"
                               class="form-label">

                            Enter Email Address

                        </label>

                        <input type="email"
                               id="email"
                               name="email"
                               value="${email}"
                               class="form-control"
                               placeholder="example@gmail.com"
                               required>

                    </div>

                    <button type="submit"
                            class="send-btn">

                        <i class="fa-solid fa-paper-plane"></i>
                        Send OTP

                    </button>

                </form>

                <!-- DIVIDER -->

                <div class="divider">

                    Verify OTP

                </div>

                <!-- VERIFY OTP FORM -->

                <form action="verifyOtp" method="post">

                    <!-- HIDDEN EMAIL -->

                    <input type="hidden"
                           name="email"
                           value="${email}">

                    <!-- OTP -->

                    <div class="mb-4">

                        <label for="otp"
                               class="form-label">

                            Enter OTP

                        </label>

                        <input type="text"
                               id="otp"
                               name="otp"
                               class="form-control"
                               placeholder="Enter your OTP"
                               required>

                    </div>

                    <!-- VERIFY BUTTON -->

                    <button type="submit"
                            class="verify-btn">

                        <i class="fa-solid fa-shield-halved"></i>
                        Verify OTP

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

<!-- FOOTER -->

<footer>

    <span id="dateTime" class="date-time"></span>

    <p>
        © 2026 Vendor Management System | All Rights Reserved
    </p>

</footer>

<!-- SCRIPT -->

<script>

    function updateDateTime(){

        document.getElementById("dateTime").textContent =
            new Date().toLocaleString();

    }

    setInterval(updateDateTime,1000);

    updateDateTime();

</script>

<!-- BOOTSTRAP -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>