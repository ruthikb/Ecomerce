<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>

        Reset Password | Vendor Management System

    </title>

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
            --success:#22c55e;
            --danger:#ef4444;
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

            background:linear-gradient(
                    135deg,
                    #0f172a,
                    #1e3a8a,
                    #2563eb);

            overflow-x:hidden;

            padding-top:110px;

            padding-bottom:100px;

            position:relative;
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

            background:rgba(255,255,255,0.06);

            border-radius:50%;

            bottom:-120px;
            right:-120px;

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

            background:rgba(255,255,255,0.08);

            backdrop-filter:blur(12px);

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

            background:linear-gradient(
                    45deg,
                    #2563eb,
                    #60a5fa);

            color:white;

            font-weight:600;

            transition:0.4s;
        }

        .back-btn:hover{

            transform:translateY(-3px);

            box-shadow:0 8px 20px rgba(96,165,250,0.5);
        }

        /* MAIN */

        .main-container{

            position:relative;

            z-index:2;
        }

        /* CARD */

        .reset-card{

            background:rgba(255,255,255,0.12);

            backdrop-filter:blur(15px);

            border:1px solid rgba(255,255,255,0.1);

            border-radius:30px;

            padding:40px;

            box-shadow:0 10px 35px rgba(0,0,0,0.3);

            animation:fadeIn 1s ease;
        }

        /* ICON */

        .icon-box{

            width:100px;
            height:100px;

            background:linear-gradient(
                    45deg,
                    #2563eb,
                    #60a5fa);

            border-radius:50%;

            display:flex;

            justify-content:center;

            align-items:center;

            margin:0 auto 25px;

            box-shadow:0 10px 25px rgba(37,99,235,0.4);
        }

        .icon-box i{

            font-size:40px;

            color:white;
        }

        /* TITLE */

        .reset-title{

            text-align:center;

            color:white;

            font-size:32px;

            font-weight:700;

            margin-bottom:10px;
        }

        .reset-subtitle{

            text-align:center;

            color:#dbeafe;

            margin-bottom:35px;

            font-size:15px;
        }

        /* FORM */

        .form-label{

            color:white;

            font-weight:500;

            margin-bottom:8px;
        }

        .form-control{

            height:55px;

            border:none;

            border-radius:15px;

            background:rgba(255,255,255,0.15);

            color:white;

            padding-left:15px;

            transition:0.3s;
        }

        .form-control::placeholder{

            color:#dbeafe;
        }

        .form-control:focus{

            background:rgba(255,255,255,0.2);

            border:1px solid #60a5fa;

            box-shadow:none;

            color:white;
        }

        /* INPUT GROUP */

        .input-group-text{

            background:rgba(255,255,255,0.15);

            border:none;

            color:white;

            border-radius:0 15px 15px 0;
        }

        /* VALIDATION */

        .error-message{

            color:#ffb3b3;

            font-size:13px;

            margin-top:6px;

            display:none;
        }

        .input-error{

            border:2px solid #ef4444 !important;
        }

        .input-success{

            border:2px solid #22c55e !important;
        }

        /* BUTTON */

        .reset-btn{

            width:100%;

            height:55px;

            border:none;

            border-radius:15px;

            background:linear-gradient(
                    45deg,
                    #22c55e,
                    #4ade80);

            color:white;

            font-size:18px;

            font-weight:600;

            transition:0.4s;

            margin-top:10px;
        }

        .reset-btn:hover{

            transform:translateY(-3px);

            box-shadow:0 10px 20px rgba(74,222,128,0.5);
        }

        /* FOOTER */

        footer{

            position:fixed;

            bottom:0;
            left:0;

            width:100%;

            height:60px;

            background:rgba(255,255,255,0.08);

            backdrop-filter:blur(10px);

            border-top:1px solid rgba(255,255,255,0.1);

            display:flex;

            justify-content:center;

            align-items:center;

            color:white;

            z-index:1000;
        }

        footer p{

            margin:0;
        }

        .date-time{

            position:absolute;

            right:20px;

            color:#93c5fd;

            font-weight:600;
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

            .reset-card{

                padding:30px;
            }

            .reset-title{

                font-size:26px;
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
            onclick="window.location.href='otpPage'">

        <i class="fa-solid fa-arrow-left"></i>

        Back

    </button>

</header>

<!-- MAIN -->

<div class="container main-container">

    <div class="row justify-content-center align-items-center"
         style="min-height:70vh;">

        <div class="col-md-6 col-lg-5">

            <!-- CARD -->

            <div class="reset-card">

                <!-- ICON -->

                <div class="icon-box">

                    <i class="fa-solid fa-key"></i>

                </div>

                <!-- TITLE -->

                <h2 class="reset-title">

                    Reset Password

                </h2>

                <p class="reset-subtitle">

                    Create a strong password to secure your account

                </p>

                <!-- FORM -->

                <form action="resetPassword"
                      method="post"
                      onsubmit="return validateForm()">

                    <!-- EMAIL -->

                    <div class="mb-4">

                        <label for="email"
                               class="form-label">

                            Email Address

                        </label>

                        <input type="email"
                               class="form-control"
                               id="email"
                               name="email"
                               value="${email}"
                               placeholder="Enter your email"
                               onchange="validateEmail()"
                               required>

                        <div id="emailError"
                             class="error-message"></div>

                    </div>

                    <!-- NEW PASSWORD -->

                    <div class="mb-4">

                        <label for="newPassword"
                               class="form-label">

                            New Password

                        </label>

                        <div class="input-group">

                            <input type="password"
                                   class="form-control"
                                   id="newPassword"
                                   name="newPassword"
                                   placeholder="Enter new password"
                                   onchange="validateNewPassword()"
                                   required>

                            <span class="input-group-text">

                                <i class="fa-solid fa-lock"></i>

                            </span>

                        </div>

                        <div id="newPasswordError"
                             class="error-message"></div>

                    </div>

                    <!-- CONFIRM PASSWORD -->

                    <div class="mb-4">

                        <label for="confirmPassword"
                               class="form-label">

                            Confirm Password

                        </label>

                        <div class="input-group">

                            <input type="password"
                                   class="form-control"
                                   id="confirmPassword"
                                   name="confirmPassword"
                                   placeholder="Re-enter new password"
                                   onchange="validateConfirmPassword()"
                                   required>

                            <span class="input-group-text">

                                <i class="fa-solid fa-shield-halved"></i>

                            </span>

                        </div>

                        <div id="confirmPasswordError"
                             class="error-message"></div>

                    </div>

                    <!-- BUTTON -->

                    <button type="submit"
                            class="reset-btn">

                        <i class="fa-solid fa-rotate"></i>

                        Reset Password

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

<!-- FOOTER -->

<footer>

    <span id="dateTime"
          class="date-time"></span>

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

    // ERROR FUNCTION

    function setError(field,errorId,message){

        field.classList.add("input-error");

        field.classList.remove("input-success");

        document.getElementById(errorId).style.display =
            "block";

        document.getElementById(errorId).innerHTML =
            message;
    }

    // SUCCESS FUNCTION

    function setSuccess(field,errorId){

        field.classList.remove("input-error");

        field.classList.add("input-success");

        document.getElementById(errorId).style.display =
            "none";
    }

    // EMAIL VALIDATION

    function validateEmail(){

        let field =
            document.getElementById("email");

        let value =
            field.value.trim();

        let pattern =
            /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(value === ""){

            setError(field,
                     "emailError",
                     "Email is required");

            return false;
        }

        if(!pattern.test(value)){

            setError(field,
                     "emailError",
                     "Enter valid email");

            return false;
        }

        setSuccess(field,
                   "emailError");

        return true;
    }

    // NEW PASSWORD VALIDATION

    function validateNewPassword(){

        let field =
            document.getElementById("newPassword");

        let value =
            field.value.trim();

        let passwordPattern =
            /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$/;

        if(value === ""){

            setError(field,
                     "newPasswordError",
                     "Password is required");

            return false;
        }

        if(!passwordPattern.test(value)){

            setError(field,
                     "newPasswordError",
                     "Min 8 chars, uppercase, lowercase, number & special char");

            return false;
        }

        setSuccess(field,
                   "newPasswordError");

        return true;
    }

    // CONFIRM PASSWORD VALIDATION

    function validateConfirmPassword(){

        let field =
            document.getElementById("confirmPassword");

        let value =
            field.value.trim();

        let newPassword =
            document.getElementById("newPassword").value.trim();

        if(value === ""){

            setError(field,
                     "confirmPasswordError",
                     "Confirm password is required");

            return false;
        }

        if(value !== newPassword){

            setError(field,
                     "confirmPasswordError",
                     "Passwords do not match");

            return false;
        }

        setSuccess(field,
                   "confirmPasswordError");

        return true;
    }

    // FORM VALIDATION

    function validateForm(){

        return validateEmail() &&
               validateNewPassword() &&
               validateConfirmPassword();
    }

</script>

<!-- BOOTSTRAP -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>