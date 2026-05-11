<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8"/>

    <meta name="viewport"
          content="width=device-width, initial-scale=1"/>
           <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">

    <title>Add Customer</title>

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

    <!-- Axios -->

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <!-- Google Font -->

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
            background:linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
            min-height:100vh;
            overflow-x:hidden;
            color:white;
        }

        .navbar{
            background:rgba(255,255,255,0.08)!important;
            backdrop-filter:blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.1);
            padding:12px 20px;
        }

        .navbar-brand{
            font-size:24px;
            font-weight:700;
            color:white!important;
        }

        .sidebar{
            position:fixed;
            top:75px;
            left:20px;
            width:260px;
            height:calc(100vh - 100px);
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(12px);
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
            background:rgba(255,255,255,0.12);
            transform:translateX(5px);
            color:#93c5fd;
        }

        .main-content{
            margin-left:300px;
            margin-top:100px;
            padding:30px;
        }

        .form-card{
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(12px);
            border-radius:30px;
            padding:40px;
            border:1px solid rgba(255,255,255,0.1);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
        }

        .form-title{
            text-align:center;
            font-size:36px;
            font-weight:700;
            margin-bottom:35px;
            color:white;
        }

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
            background:rgba(255,255,255,0.12);
            color:white;
            transition:0.3s;
        }

        textarea.form-control{
            height:120px;
            resize:none;
            padding-top:15px;
        }

        .form-control::placeholder{
            color:#dbeafe;
        }

        .form-control:focus,
        .form-select:focus{
            background:rgba(255,255,255,0.18);
            box-shadow:none;
            border:1px solid #60a5fa;
            color:white;
        }

        option{
            color:black;
        }

        .submit-btn{
            width:100%;
            height:55px;
            border:none;
            border-radius:15px;
            background:linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-size:18px;
            font-weight:600;
            transition:0.4s;
            margin-top:15px;
        }

        .submit-btn:hover{
            transform:translateY(-5px);
            box-shadow:0 10px 20px rgba(96,165,250,0.5);
        }

        .text-warning{
            font-size:13px;
        }

        footer{
            position:fixed;
            bottom:0;
            left:0;
            width:100%;
            height:60px;
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(10px);
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
        }

        .date-time{
            position:absolute;
            right:20px;
            color:#93c5fd;
            font-weight:600;
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <div class="container-fluid">

        <!-- LOGO -->

        <a class="navbar-brand" href="Admin.jsp">

            <i class="bi bi-laptop"></i>
            Vendor Management System

        </a>

        <!-- TOGGLER -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- RIGHT SIDE -->

        <div class="collapse navbar-collapse justify-content-end"
             id="navbarContent">

            <ul class="navbar-nav align-items-center">

                <!-- NOTIFICATION -->

                <li class="nav-item me-3">

                    <a href="notification"
                       class="nav-link">

                        <i class="bi bi-bell-fill fs-5"></i>

                    </a>

                </li>

                <!-- USER -->

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                        Admin

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <a class="dropdown-item"
                               href="logOut">

                                Log-Out

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

    <div class="form-card">

        <h2 class="form-title">

            Add Customer

        </h2>

        <form class="row g-4"
              action="addCustomer"
              method="post"
              onsubmit="return validateForm()">

            <!-- LEFT SIDE -->

            <div class="col-md-6">

                <label class="form-label">

                    Customer Name

                </label>

                <input type="text"
                       class="form-control"
                       name="customerName"
                       id="customerName"
                       placeholder="Enter customer name"
                       onchange="validateCustomerName()"
                       required>

                <span id="customerNameError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    Customer Type

                </label>

                <select class="form-select"
                        name="customerType"
                        id="customerType"
                        onchange="validateCustomerType()"
                        required>

                    <option value="">

                        Select Type

                    </option>

                    <option value="creditor">

                        Creditor

                    </option>

                    <option value="debtor">

                        Debtor

                    </option>

                </select>

                <span id="customerTypeError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    Email

                </label>

                <input type="email"
                       class="form-control"
                       name="email"
                       id="email"
                       placeholder="Enter email"
                       onchange="validateEmail()">

                <span id="emailError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    Contact Number

                </label>

                <input type="text"
                       class="form-control"
                       name="contactNumber"
                       id="contactNumber"
                       placeholder="Enter contact number"
                       onchange="validateContactNumber()">

                <span id="contactError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    GST Number

                </label>

                <input type="text"
                       class="form-control"
                       name="gstNumber"
                       id="gstNumber"
                       placeholder="Enter GST number"
                       onchange="validateGST()">

                <span id="gstError"
                      class="text-warning"></span>

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

                    PinCode

                </label>

                <input type="text"
                       class="form-control"
                       name="pinCode"
                       id="pinCode"
                       placeholder="Enter pincode"
                       onchange="checkPinCode()">

                <span id="pinCodeError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    State

                </label>

                <select class="form-select"
                        name="state"
                        id="state"
                        onchange="validateState()">

                    <option selected disabled>

                        Select State

                    </option>

                </select>

                <span id="stateError"
                      class="text-warning"></span>

                <label class="form-label mt-3">

                    City

                </label>

                <input type="text"
                       class="form-control"
                       name="city"
                       id="city"
                       placeholder="Enter city"
                       onchange="validateCity()">

                <span id="cityError"
                      class="text-warning"></span>

                <!-- SAME SHIPPING ADDRESS -->

                <label class="form-label mt-3">

                    Same Shipping Address?

                </label>

                <div class="d-flex mt-2">

                    <div class="form-check me-4">

                        <input class="form-check-input"
                               type="radio"
                               name="sameAddress"
                               value="yes"
                               id="sameYes"
                               onchange="handleShippingAddress()">

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
                               id="sameNo"
                               onchange="handleShippingAddress()">

                        <label class="form-check-label"
                               for="sameNo">

                            No

                        </label>

                    </div>

                </div>

                <span id="sameAddressError"
                      class="text-warning"></span>

                <!-- SHIPPING ADDRESS -->

                <label class="form-label mt-3">

                    Shipping Address

                </label>

                <textarea class="form-control"
                          name="shippingAddress"
                          id="shippingAddress"
                          placeholder="Enter shipping address"
                          onchange="validateShippingAddress()"></textarea>

                <span id="shippingAddressError"
                      class="text-warning"></span>

            </div>

            <!-- BILLING ADDRESS -->

            <div class="col-12">

                <label class="form-label">

                    Billing Address

                </label>

                <textarea class="form-control"
                          name="billingAddress"
                          id="billingAddress"
                          placeholder="Enter billing address"
                          onchange="syncBillingAddress()"
                          required></textarea>

                <span id="billingAddressError"
                      class="text-warning"></span>

            </div>

            <!-- ADDRESS -->

            <div class="col-12">

                <label class="form-label">

                    Address

                </label>

                <textarea class="form-control"
                          name="address"
                          id="address"
                          placeholder="Enter address"
                          onchange="validateAddress()"
                          required></textarea>

                <span id="addressError"
                      class="text-warning"></span>

            </div>

            <!-- PAYMENT MODE -->

            <div class="col-12">

                <label class="form-label">

                    Payment Mode

                </label>

                <select class="form-select"
                        name="paymentMode"
                        id="paymentMode"
                        onchange="validatePaymentMode()"
                        required>

                    <option value="">

                        Select Payment Mode

                    </option>

                    <option value="online">

                        Online

                    </option>

                    <option value="cash">

                        Cash

                    </option>

                    <option value="cheque">

                        Cheque

                    </option>

                </select>

                <span id="paymentModeError"
                      class="text-warning"></span>

            </div>

            <!-- SUBMIT BUTTON -->

            <div class="col-12 text-center">

                <button type="submit"
                        class="submit-btn">

                    <i class="bi bi-check-circle-fill"></i>

                    Submit Customer

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

        document.getElementById("dateTime").textContent =
            new Date().toLocaleString();
    }

    setInterval(updateDateTime,1000);

    updateDateTime();

    function setError(id,errorId,message){

        document.getElementById(errorId).innerHTML =
            message;

        document.getElementById(id).style.border =
            "2px solid red";
    }

    function setSuccess(id,errorId){

        document.getElementById(errorId).innerHTML =
            "";

        document.getElementById(id).style.border =
            "2px solid limegreen";
    }

    function validateCustomerName(){

        let value =
            document.getElementById("customerName").value.trim();

        if(value.length < 3){

            setError(
                "customerName",
                "customerNameError",
                "Minimum 3 characters required"
            );

            return false;
        }

        setSuccess(
            "customerName",
            "customerNameError"
        );

        return true;
    }

    function validateCustomerType(){

        let value =
            document.getElementById("customerType").value;

        if(value === ""){

            setError(
                "customerType",
                "customerTypeError",
                "Select customer type"
            );

            return false;
        }

        setSuccess(
            "customerType",
            "customerTypeError"
        );

        return true;
    }

    function validateEmail(){

        let value =
            document.getElementById("email").value.trim();

        let pattern =
            /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(!pattern.test(value)){

            setError(
                "email",
                "emailError",
                "Enter valid email"
            );

            return false;
        }

        setSuccess(
            "email",
            "emailError"
        );

        return true;
    }

    function validateContactNumber(){

        let value =
            document.getElementById("contactNumber").value.trim();

        let pattern =
            /^[6-9]\d{9}$/;

        if(!pattern.test(value)){

            setError(
                "contactNumber",
                "contactError",
                "Enter valid 10 digit number"
            );

            return false;
        }

        setSuccess(
            "contactNumber",
            "contactError"
        );

        return true;
    }

    function validateGST(){

        let value =
            document.getElementById("gstNumber").value.trim();

        let pattern =
            /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;

        if(!pattern.test(value)){

            setError(
                "gstNumber",
                "gstError",
                "Enter valid GST number"
            );

            return false;
        }

        setSuccess(
            "gstNumber",
            "gstError"
        );

        return true;
    }

    async function checkPinCode(){

        const pinCode =
            document.getElementById('pinCode').value.trim();

        const stateSelect =
            document.getElementById('state');

        const cityInput =
            document.getElementById('city');

        if(pinCode.length !== 6 || isNaN(pinCode)){

            setError(
                "pinCode",
                "pinCodeError",
                "Enter valid 6 digit pincode"
            );

            return false;
        }

        try{

            const response =
                await axios.get(`https://api.postalpincode.in/pincode/${pinCode}`);

            const data =
                response.data;

            if(data[0].Status === "Success"){

                const office =
                    data[0].PostOffice[0];

                stateSelect.innerHTML =
                    `<option selected>${office.State}</option>`;

                cityInput.value =
                    office.District;

                setSuccess(
                    "pinCode",
                    "pinCodeError"
                );

                return true;

            }else{

                setError(
                    "pinCode",
                    "pinCodeError",
                    "No data found"
                );

                return false;
            }

        }catch(error){

            setError(
                "pinCode",
                "pinCodeError",
                "Failed to fetch data"
            );

            return false;
        }
    }

    function validateState(){

        let value =
            document.getElementById("state").value;

        if(value === ""){

            setError(
                "state",
                "stateError",
                "Select state"
            );

            return false;
        }

        setSuccess(
            "state",
            "stateError"
        );

        return true;
    }

    function validateCity(){

        let value =
            document.getElementById("city").value.trim();

        if(value === ""){

            setError(
                "city",
                "cityError",
                "City is required"
            );

            return false;
        }

        setSuccess(
            "city",
            "cityError"
        );

        return true;
    }

    // SHIPPING ADDRESS FUNCTION

    function handleShippingAddress(){

        let yes =
            document.getElementById("sameYes");

        let no =
            document.getElementById("sameNo");

        let billingAddress =
            document.getElementById("billingAddress");

        let shippingAddress =
            document.getElementById("shippingAddress");

        if(yes.checked){

            shippingAddress.value =
                billingAddress.value;

            shippingAddress.readOnly = true;

            shippingAddress.style.background =
                "rgba(255,255,255,0.08)";

            shippingAddress.style.border =
                "2px solid limegreen";
        }

        else if(no.checked){

            shippingAddress.readOnly = false;

            shippingAddress.value = "";

            shippingAddress.style.background =
                "rgba(255,255,255,0.12)";

            shippingAddress.style.border =
                "1px solid rgba(255,255,255,0.1)";
        }
    }

    // AUTO UPDATE SHIPPING ADDRESS

    function syncBillingAddress(){

        validateBillingAddress();

        let yes =
            document.getElementById("sameYes");

        let billingAddress =
            document.getElementById("billingAddress");

        let shippingAddress =
            document.getElementById("shippingAddress");

        if(yes.checked){

            shippingAddress.value =
                billingAddress.value;
        }
    }

    function validateShippingAddress(){

        let value =
            document.getElementById("shippingAddress").value.trim();

        if(value === ""){

            setError(
                "shippingAddress",
                "shippingAddressError",
                "Shipping address required"
            );

            return false;
        }

        setSuccess(
            "shippingAddress",
            "shippingAddressError"
        );

        return true;
    }

    function validateBillingAddress(){

        let value =
            document.getElementById("billingAddress").value.trim();

        if(value === ""){

            setError(
                "billingAddress",
                "billingAddressError",
                "Billing address required"
            );

            return false;
        }

        setSuccess(
            "billingAddress",
            "billingAddressError"
        );

        return true;
    }

    function validateAddress(){

        let value =
            document.getElementById("address").value.trim();

        if(value === ""){

            setError(
                "address",
                "addressError",
                "Address required"
            );

            return false;
        }

        setSuccess(
            "address",
            "addressError"
        );

        return true;
    }

    function validatePaymentMode(){

        let value =
            document.getElementById("paymentMode").value;

        if(value === ""){

            setError(
                "paymentMode",
                "paymentModeError",
                "Select payment mode"
            );

            return false;
        }

        setSuccess(
            "paymentMode",
            "paymentModeError"
        );

        return true;
    }

    function validateForm(){

        return validateCustomerName() &&
               validateCustomerType() &&
               validateEmail() &&
               validateContactNumber() &&
               validateGST() &&
               validateState() &&
               validateCity() &&
               validateShippingAddress() &&
               validateBillingAddress() &&
               validateAddress() &&
               validatePaymentMode();
    }

</script>

<!-- Bootstrap -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>