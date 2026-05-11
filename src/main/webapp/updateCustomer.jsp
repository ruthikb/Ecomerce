<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>Update Customer</title>

    <!-- BOOTSTRAP -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- BOOTSTRAP ICONS -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

    <!-- AXIOS -->

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!-- GOOGLE FONT -->

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

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
            background: linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
            min-height:100vh;
            overflow-x:hidden;
            color:white;
        }

        /* NAVBAR */

        .navbar{
            background: rgba(255,255,255,0.08) !important;
            backdrop-filter: blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.1);
            padding:12px 20px;
        }

        .navbar-brand{
            font-size:24px;
            font-weight:700;
            color:white !important;
        }

        .nav-link{
            color:white !important;
            transition:0.3s;
        }

        .nav-link:hover{
            color:#93c5fd !important;
        }

        /* SIDEBAR */

        .sidebar{
            position:fixed;
            top:75px;
            left:20px;
            width:260px;
            height:calc(100vh - 100px);
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:25px;
            padding:25px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
        }

        .sidebar-title{
            text-align:center;
            font-size:24px;
            font-weight:700;
            margin-bottom:25px;
            color:white;
        }

        .menu-link{
            display:flex;
            align-items:center;
            padding:15px;
            border-radius:15px;
            margin-bottom:15px;
            text-decoration:none;
            color:white;
            transition:0.3s;
            font-size:16px;
            font-weight:500;
        }

        .menu-link i{
            margin-right:12px;
            font-size:20px;
        }

        .menu-link:hover{
            background: rgba(255,255,255,0.12);
            transform:translateX(5px);
            color:#93c5fd;
        }

        /* MAIN CONTENT */

        .main-content{
            margin-left:300px;
            margin-top:100px;
            padding:30px;
        }

        /* FORM CARD */

        .form-card{
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(12px);
            border-radius:30px;
            padding:40px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
            animation:fadeIn 1s ease;
        }

        .form-title{
            text-align:center;
            font-size:38px;
            font-weight:700;
            margin-bottom:35px;
            color:white;
        }

        /* FORM CONTROLS */

        .form-label{
            color:white;
            font-weight:500;
            margin-bottom:8px;
        }

        .form-control,
        .form-select{
            height:52px;
            border:none;
            border-radius:15px;
            background: rgba(255,255,255,0.12);
            color:white;
            transition:0.3s;
        }

        .form-control:focus,
        .form-select:focus{
            background: rgba(255,255,255,0.18);
            box-shadow:none;
            border:1px solid #60a5fa;
            color:white;
        }

        .form-control::placeholder{
            color:#dbeafe;
        }

        option{
            color:black;
        }

        /* RADIO */

        .form-check-label{
            color:white;
        }

        .form-check-input:checked{
            background-color:#2563eb;
            border-color:#2563eb;
        }

        /* UPDATE BUTTON */

        .update-btn{
            width:100%;
            height:55px;
            border:none;
            border-radius:15px;
            background: linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-size:18px;
            font-weight:600;
            transition:0.4s;
            margin-top:15px;
        }

        .update-btn:hover{
            transform:translateY(-5px);
            box-shadow:0 10px 20px rgba(96,165,250,0.5);
        }

        /* ERROR */

        #stateCityError{
            margin-top:10px;
            color:#f87171;
            font-size:14px;
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

        @media(max-width:991px){

            .sidebar{
                position:relative;
                width:100%;
                left:0;
                top:90px;
                height:auto;
                margin-bottom:20px;
            }

            .main-content{
                margin-left:0;
                margin-top:120px;
            }

            .form-title{
                font-size:30px;
            }

            .date-time{
                display:none;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <div class="container-fluid">

        <a class="navbar-brand"
           href="Admin.jsp">

            <i class="bi bi-laptop"></i>
            Vendor Management System

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse justify-content-end"
             id="navbarContent">

            <ul class="navbar-nav">

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>
                        Admin

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <a class="dropdown-item"
                               href="logOut">

                                Logout

                            </a>

                        </li>

                    </ul>

                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="sidebar-title">

        Admin Menu

    </div>

    <a href="addCustomerPage"
       class="menu-link">

        <i class="bi bi-person-plus-fill"></i>
        Add Customer

    </a>

    <a href="getAllCustomers"
       class="menu-link">

        <i class="bi bi-people-fill"></i>
        View Customers

    </a>

    <a href="viewUser"
       class="menu-link">

        <i class="bi bi-person-fill"></i>
        View User

    </a>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <!-- FORM CARD -->

    <div class="form-card">

        <h2 class="form-title">

            Update Customer

        </h2>

        <!-- FORM -->

        <form class="row g-4"
              action="updateCustomerById"
              method="post">

            <!-- HIDDEN ID -->

            <input type="hidden"
                   name="id"
                   value="${customer.id}">

            <!-- LEFT SIDE -->

            <div class="col-md-6">

                <label class="form-label">

                    Customer Name

                </label>

                <input type="text"
                       class="form-control"
                       name="customerName"
                       value="${customer.customerName}"
                       required>

                <label class="form-label mt-3">

                    Customer Type

                </label>

                <select class="form-select"
                        name="customerType">

                    <option value="">

                        Select Type

                    </option>

                    <option value="creditor"
                    <c:if test="${customer.customerType=='creditor'}">
                        selected
                    </c:if>>

                        Creditor

                    </option>

                    <option value="debtor"
                    <c:if test="${customer.customerType=='debtor'}">
                        selected
                    </c:if>>

                        Debtor

                    </option>

                </select>

                <label class="form-label mt-3">

                    Email

                    </label>

                <input type="email"
                       class="form-control"
                       name="email"
                       value="${customer.email}"
                       required>

                <label class="form-label mt-3">

                    Contact Number

                </label>

                <input type="text"
                       class="form-control"
                       name="contactNumber"
                       value="${customer.contactNumber}"
                       required>

                <label class="form-label mt-3">

                    GST Number

                </label>

                <input type="text"
                       class="form-control"
                       name="gstNumber"
                       value="${customer.gstNumber}">

                <label class="form-label mt-3">

                    Country

                </label>

                <input type="text"
                       class="form-control"
                       name="country"
                       value="India"
                       readonly>

            </div>

            <!-- RIGHT SIDE -->

            <div class="col-md-6">

                <label class="form-label">

                    Pin Code

                </label>

                <input type="text"
                       id="pinCode"
                       class="form-control"
                       name="pinCode"
                       value="${customer.pinCode}"
                       onchange="checkPinCode()"
                       required>

                <div id="stateCityError"></div>

                <label class="form-label mt-3">

                    State

                </label>

                <select class="form-select"
                        id="state"
                        name="state">

                    <option selected>

                        ${customer.state}

                    </option>

                </select>

                <label class="form-label mt-3">

                    City

                </label>

                <input type="text"
                       id="city"
                       class="form-control"
                       name="city"
                       value="${customer.city}">

                <label class="form-label mt-3">

                    Billing Address

                </label>

                <input type="text"
                       class="form-control"
                       id="billingAddress"
                       name="billingAddress"
                       value="${customer.billingAddress}">

                <label class="form-label mt-3">

                    Shipping Address

                </label>

                <input type="text"
                       class="form-control"
                       id="shippingAddress"
                       name="shippingAddress"
                       value="${customer.shippingAddress}">

                <label class="form-label mt-3">

                    Same as Billing?

                </label>

                <div class="d-flex gap-4 mt-2">

                    <div class="form-check">

                        <input class="form-check-input"
                               type="radio"
                               name="sameAddress"
                               value="yes"
                               id="sameYes">

                        <label class="form-check-label"
                               for="sameYes">

                            Yes

                        </label>

                    </div>

                    <div class="form-check">

                        <input class="form-check-input"
                               type="radio"
                               name="sameAddress"
                               value="no"
                               id="sameNo">

                        <label class="form-check-label"
                               for="sameNo">

                            No

                        </label>

                    </div>

                </div>

            </div>

            <!-- PAYMENT -->

            <div class="col-12 mt-4">

                <label class="form-label">

                    Payment Mode

                </label>

                <div class="d-flex flex-wrap gap-4 mt-2">

                    <div class="form-check">

                        <input class="form-check-input"
                               type="radio"
                               name="paymentMode"
                               value="online"
                        <c:if test="${customer.paymentMode=='online'}">
                            checked
                        </c:if>>

                        <label class="form-check-label">

                            Online

                        </label>

                    </div>

                    <div class="form-check">

                        <input class="form-check-input"
                               type="radio"
                               name="paymentMode"
                               value="cash"
                        <c:if test="${customer.paymentMode=='cash'}">
                            checked
                        </c:if>>

                        <label class="form-check-label">

                            Cash

                        </label>

                    </div>

                    <div class="form-check">

                        <input class="form-check-input"
                               type="radio"
                               name="paymentMode"
                               value="cheque"
                        <c:if test="${customer.paymentMode=='cheque'}">
                            checked
                        </c:if>>

                        <label class="form-check-label">

                            Cheque

                        </label>

                    </div>

                </div>

            </div>

            <!-- BUTTON -->

            <div class="col-12 text-center mt-4">

                <button type="submit"
                        class="update-btn">

                    <i class="bi bi-arrow-repeat"></i>
                    Update Customer

                </button>

            </div>

        </form>

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

        document.getElementById("dateTime").innerText =
            new Date().toLocaleString();

    }

    setInterval(updateDateTime,1000);

    updateDateTime();

    async function checkPinCode(){

        const pin =
            document.getElementById("pinCode").value;

        const error =
            document.getElementById("stateCityError");

        const state =
            document.getElementById("state");

        const city =
            document.getElementById("city");

        error.innerHTML = "";

        if(pin.length != 6){

            error.innerHTML =
                "Enter valid pincode";

            return;
        }

        try{

            const response =
                await axios.get(`https://api.postalpincode.in/pincode/${pin}`);

            const data = response.data;

            if(data[0].Status == "Success"){

                state.innerHTML =
                    `<option>${data[0].PostOffice[0].State}</option>`;

                city.value =
                    data[0].PostOffice[0].District;

            }

        }catch(e){

            error.innerHTML =
                "Failed to fetch pincode";

        }

    }

    document.getElementById("sameYes")
        .addEventListener("change",function(){

            document.getElementById("shippingAddress").value =
                document.getElementById("billingAddress").value;

            document.getElementById("shippingAddress").readOnly = true;

        });

    document.getElementById("sameNo")
        .addEventListener("change",function(){

            document.getElementById("shippingAddress").readOnly = false;

        });

</script>

<!-- BOOTSTRAP -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>