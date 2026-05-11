<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8"/>

    <meta name="viewport"
          content="width=device-width, initial-scale=1"/>
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>Vendor Login</title>

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Google Font -->

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

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

            display:flex;
            justify-content:center;
            align-items:center;

            position:relative;

            overflow-x:hidden;

            padding-top:100px;
            padding-bottom:80px;
        }

        body::before{

            content:'';

            position:absolute;

            width:500px;
            height:500px;

            background:rgba(255,255,255,0.05);

            border-radius:50%;

            top:-180px;
            left:-180px;

            z-index:0;
        }

        body::after{

            content:'';

            position:absolute;

            width:400px;
            height:400px;

            background:rgba(255,255,255,0.04);

            border-radius:50%;

            bottom:-150px;
            right:-150px;

            z-index:0;
        }

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

        .home-btn{

            border:none;

            padding:12px 24px;

            border-radius:30px;

            background:linear-gradient(
                    45deg,
                    #2563eb,
                    #60a5fa);

            color:white;

            font-weight:600;

            transition:0.3s ease;

            box-shadow:0 4px 15px rgba(0,0,0,0.2);
        }

        .home-btn:hover{

            transform:translateY(-3px);

            box-shadow:0 8px 20px rgba(96,165,250,0.5);
        }

        .login-container{

            width:100%;

            display:flex;
            justify-content:center;
            align-items:center;

            padding:20px;

            position:relative;

            z-index:2;
        }

        .login-card{

            width:100%;
            max-width:430px;

            padding:40px 35px;

            border-radius:30px;

            background:rgba(255,255,255,0.12);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,0.15);

            box-shadow:0 15px 40px rgba(0,0,0,0.35);

            animation:fadeIn 0.8s ease;

            transition:0.3s;
        }

        .login-card:hover{

            transform:translateY(-4px);
        }

        .login-icon{

            width:90px;
            height:90px;

            background:linear-gradient(
                    45deg,
                    #2563eb,
                    #60a5fa);

            border-radius:50%;

            display:flex;
            justify-content:center;
            align-items:center;

            margin:0 auto 25px;

            box-shadow:0 8px 25px rgba(37,99,235,0.5);
        }

        .login-icon i{

            font-size:40px;
            color:white;
        }

        .login-card h2{

            text-align:center;
            color:white;

            font-weight:700;

            margin-bottom:10px;
        }

        .login-card p{

            text-align:center;

            color:#dbeafe;

            margin-bottom:30px;

            font-size:14px;
        }

        .form-label{

            color:white;

            font-weight:500;

            margin-bottom:8px;
        }

        .form-control{

            height:52px;

            border:none;

            border-radius:14px;

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

            box-shadow:0 0 12px rgba(96,165,250,0.4);

            color:white;
        }

        .input-error{

            border:2px solid #ff4d4d !important;
        }

        .input-success{

            border:2px solid #00e676 !important;
        }

        .error-message{

            color:#ffb3b3;

            font-size:13px;

            margin-top:6px;

            display:none;
        }

        .login-btn{

            width:100%;
            height:52px;

            border:none;

            border-radius:15px;

            background:linear-gradient(
                    45deg,
                    #2563eb,
                    #60a5fa);

            color:white;

            font-size:17px;
            font-weight:600;

            margin-top:15px;

            transition:0.3s ease;

            box-shadow:0 6px 18px rgba(37,99,235,0.35);
        }

        .login-btn:hover{

            transform:translateY(-3px);

            box-shadow:0 10px 25px rgba(96,165,250,0.5);
        }

        .forgot-password{

            text-decoration:none;

            color:#bfdbfe;

            font-size:14px;

            transition:0.3s;
        }

        .forgot-password:hover{

            color:white;
        }

        footer{

            position:fixed;

            bottom:0;
            left:0;

            width:100%;
            height:60px;

            display:flex;
            justify-content:center;
            align-items:center;

            background:rgba(255,255,255,0.08);

            backdrop-filter:blur(12px);

            color:white;

            z-index:1000;
        }

        .date-time{

            position:absolute;

            right:20px;

            color:#93c5fd;

            font-size:14px;
        }

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

        @media(max-width:768px){

            header{

                padding:0 20px;
            }

            .logo{

                font-size:20px;
            }

            .home-btn{

                padding:10px 18px;

                font-size:14px;
            }

            .login-card{

                padding:30px 25px;
            }

            footer{

                font-size:13px;
            }

            .date-time{

                display:none;
            }
        }

        @media(max-width:480px){

            .login-card{

                border-radius:22px;
            }

            .login-icon{

                width:75px;
                height:75px;
            }

            .login-icon i{

                font-size:32px;
            }

            .login-card h2{

                font-size:24px;
            }
        }

    </style>

</head>

<body>

<header>

    <div class="logo">

        <i class="fa-solid fa-laptop"></i>

        Vendor System

    </div>

    <button class="home-btn"
            onclick="window.location.href='landingPage'">

        <i class="fa-solid fa-house"></i>

        Home

    </button>

</header>

<div class="login-container">

    <div class="login-card">

        <div class="login-icon">

            <i class="fa-solid fa-user"></i>

        </div>

        <h2>Welcome Back</h2>

        <p>

            Login to continue to Vendor Management System

        </p>

        <form action="loginUser"
              method="post"
              onsubmit="return validateForm()">

            <!-- Email -->

            <div class="mb-3">

                <label class="form-label">

                    Email or Phone Number

                </label>

                <input type="text"
                       class="form-control"
                       id="identifier"
                       name="emailOrPhone"
                       placeholder="Enter Email or Phone"
                       onchange="validateIdentifier()"
                       required>

                <div id="identifierError"
                     class="error-message">

                </div>

            </div>

            <!-- Password -->

            <div class="mb-3">

                <label class="form-label">

                    Password

                </label>

                <input type="password"
                       class="form-control"
                       id="password"
                       name="password"
                       placeholder="Enter Password"
                       onchange="validatePassword()"
                       required>

                <div id="passwordError"
                     class="error-message">

                </div>

            </div>

            <div class="d-flex justify-content-end mb-3">

                <a href="getOtp"
                   class="forgot-password">

                    Forgot Password?

                </a>

            </div>

            <!-- Backend Error -->

            <% if(request.getAttribute("error") != null){ %>

                <div class="alert alert-danger text-center"
                     style="
                        border-radius:12px;
                        background:rgba(255,77,77,0.15);
                        border:1px solid #ff4d4d;
                        color:white;
                     ">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    <%= request.getAttribute("error") %>

                </div>

            <% } %>

            <button type="submit"
                    class="login-btn">

                <i class="fa-solid fa-right-to-bracket"></i>

                Sign In

            </button>

        </form>

    </div>

</div>

<footer>

    <p>

        © 2026 Vendor Management System

    </p>

    <span id="dateTime"
          class="date-time"></span>

</footer>

<script>

    function updateDateTime(){

        document.getElementById("dateTime")
            .textContent =
            new Date().toLocaleString();
    }

    setInterval(updateDateTime,1000);

    updateDateTime();

    // EMAIL VALIDATION

    function validateIdentifier(){

        let field =
            document.getElementById("identifier");

        let error =
            document.getElementById("identifierError");

        let value =
            field.value.trim();

        let emailPattern =
            /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        let phonePattern =
            /^[6-9]\d{9}$/;

        if(value === ""){

            error.style.display = "block";

            error.innerHTML =
                "Field cannot be empty";

            field.classList.add("input-error");

            field.classList.remove("input-success");

            return false;
        }

        if(emailPattern.test(value)
            || phonePattern.test(value)){

            error.style.display = "none";

            field.classList.remove("input-error");

            field.classList.add("input-success");

            return true;
        }

        error.style.display = "block";

        error.innerHTML =
            "Enter valid Email or Phone Number";

        field.classList.add("input-error");

        field.classList.remove("input-success");

        return false;
    }

    // PASSWORD VALIDATION

    function validatePassword(){

        let field =
            document.getElementById("password");

        let error =
            document.getElementById("passwordError");

        let value =
            field.value.trim();

        if(value === ""){

            error.style.display = "block";

            error.innerHTML =
                "Password cannot be empty";

            field.classList.add("input-error");

            field.classList.remove("input-success");

            return false;
        }

        if(value.length < 6){

            error.style.display = "block";

            error.innerHTML =
                "Password must contain minimum 6 characters";

            field.classList.add("input-error");

            field.classList.remove("input-success");

            return false;
        }

        error.style.display = "none";

        field.classList.remove("input-error");

        field.classList.add("input-success");

        return true;
    }

    // FORM VALIDATION

    function validateForm(){

        let validIdentifier =
            validateIdentifier();

        let validPassword =
            validatePassword();

        return validIdentifier &&
               validPassword;
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>