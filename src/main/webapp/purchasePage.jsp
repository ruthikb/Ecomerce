<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
<title>Purchase Order Form</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

:root{
    --sidebar-width:280px;
    --navbar-height:70px;
    --footer-height:50px;
    --primary:#4f46e5;
    --secondary:#7c3aed;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#eef2ff,#f8fafc);
    min-height:100vh;
    overflow-x:hidden;
    padding-top:var(--navbar-height);
    padding-bottom:var(--footer-height);
}

/* NAVBAR */

.navbar{
    height:var(--navbar-height);
    background:linear-gradient(90deg,#111827,#1e293b);
    box-shadow:0 4px 20px rgba(0,0,0,0.2);
    padding:0 20px;
    z-index:1100;
}

.navbar-brand{
    font-size:1.4rem;
    font-weight:700;
    color:#fff !important;
    letter-spacing:0.5px;
}

/* SIDEBAR */

.sidebar{

    position:fixed;

    top:70px;
    left:0;

    width:280px;

    height:calc(100vh - 70px);

    background:linear-gradient(
            180deg,
            #0f172a 0%,
            #1e293b 100%);

    padding:25px 18px;

    overflow-y:auto;

    overflow-x:hidden;

    border-right:1px solid rgba(255,255,255,0.08);

    box-shadow:8px 0 25px rgba(0,0,0,0.15);

    z-index:1000;

    transition:all 0.3s ease;
}

/* SCROLLBAR */

.sidebar::-webkit-scrollbar{

    width:6px;
}

.sidebar::-webkit-scrollbar-thumb{

    background:#475569;

    border-radius:10px;
}

/* SIDEBAR TITLE */

.sidebar-title{

    color:white;

    text-align:center;

    font-size:26px;

    font-weight:700;

    margin-bottom:30px;

    padding-bottom:15px;

    border-bottom:1px solid rgba(255,255,255,0.1);

    letter-spacing:1px;
}

/* MENU CARD */

.menu-card{

    background:rgba(255,255,255,0.03);

    border-radius:18px;

    margin-bottom:18px;

    overflow:hidden;

    transition:0.3s ease;
}

.menu-card:hover{

    transform:translateY(-2px);
}

/* MENU TOGGLE */

.menu-toggle{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:16px 18px;

    text-decoration:none;

    color:#e2e8f0;

    font-size:15px;

    font-weight:600;

    transition:0.3s ease;

    border-radius:14px;
}

.menu-toggle:hover{

    background:linear-gradient(
            135deg,
            #2563eb,
            #3b82f6);

    color:white;

    transform:translateX(3px);

    box-shadow:0 8px 20px rgba(37,99,235,0.25);
}

/* SUB MENU */

.sub-menu{

    padding:10px 12px 15px;
}

.sub-menu a{

    display:block;

    padding:12px 15px;

    margin-bottom:10px;

    border-radius:12px;

    text-decoration:none;

    color:#cbd5e1;

    font-size:14px;

    transition:0.3s ease;

    background:rgba(255,255,255,0.03);
}

.sub-menu a:hover{

    background:rgba(59,130,246,0.25);

    color:white;

    transform:translateX(5px);
}

/* MAIN */

main{

    margin-left:280px;

    padding:35px;

    transition:0.3s ease;
}

/* CARD */

.purchase-card{
    background:#fff;
    border-radius:25px;
    padding:35px;
    box-shadow:0 10px 35px rgba(0,0,0,0.08);
}

.purchase-title{
    font-size:2rem;
    font-weight:700;
    color:#111827;
    margin-bottom:25px;
}

/* FORM */

label{
    font-weight:600;
    color:#374151;
    margin-bottom:8px;
}

.form-control,
.form-select{
    border-radius:12px;
    border:1px solid #d1d5db;
    padding:12px 15px;
    transition:0.3s;
    background:#f9fafb;
}

.form-control:focus,
.form-select:focus{
    border-color:var(--primary);
    box-shadow:0 0 0 0.2rem rgba(79,70,229,0.15);
    background:#fff;
}

.row{
    margin-top:10px;
}

.btn-primary{
    background:linear-gradient(135deg,var(--primary),var(--secondary));
    border:none;
    border-radius:14px;
    padding:14px;
    font-size:17px;
    font-weight:600;
}

/* FOOTER */

footer{
    position:fixed;
    bottom:0;
    left:0;
    right:0;
    height:var(--footer-height);
    background:#111827;
    color:#fff;
    display:flex;
    align-items:center;
    justify-content:center;
    z-index:1000;
}

footer .date-time{
    position:absolute;
    right:20px;
}

/* VALIDATION */

.error-message{
    color:red;
    font-size:13px;
    margin-top:5px;
    display:none;
}

.input-error{
    border:2px solid red !important;
}

.input-success{
    border:2px solid green !important;
}

/* RESPONSIVE */

@media(max-width:991px){

    .sidebar{

        position:relative;

        width:100%;

        height:auto;

        top:0;

        border-radius:0;

        padding:20px;
    }

    main{

        margin-left:0;

        padding:20px;
    }

    .purchase-card{

        padding:20px;
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

            <ul class="navbar-nav align-items-center">

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle text-white"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-person-circle"></i>

                        User

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <a class="dropdown-item"
                               href="logOut">

                                <i class="bi bi-box-arrow-right"></i>

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

        MENU

    </div>

    <!-- SALES -->

    <div class="menu-card">

        <a class="menu-toggle"
           data-bs-toggle="collapse"
           href="#salesMenu">

            <span>

                <i class="bi bi-cart me-2"></i>

                Sales

            </span>

            <i class="bi bi-chevron-down"></i>

        </a>

        <div class="collapse show sub-menu"
             id="salesMenu">

            <a href="addSales">

                Add Sales

            </a>

            <a href="viewSales">

                View Sales

            </a>

        </div>

    </div>

    <!-- PURCHASE -->

    <div class="menu-card">

        <a class="menu-toggle"
           data-bs-toggle="collapse"
           href="#purchaseMenu">

            <span>

                <i class="bi bi-box me-2"></i>

                Purchase

            </span>

            <i class="bi bi-chevron-down"></i>

        </a>

        <div class="collapse show sub-menu"
             id="purchaseMenu">

            <a href="addPurchase">

                Add Purchase

            </a>

            <a href="viewPurchase">

                View Purchase

            </a>

        </div>

    </div>

</div>

<!-- MAIN -->

<main>

<div class="purchase-card">

<h2 class="purchase-title">

    <i class="bi bi-bag-check-fill"></i>

    Purchase Order Form

</h2>

<form action="savePurchase"
          method="post"
          onsubmit="return validateForm()">

        <!-- VOUCHER -->

        <div class="mb-4">

            <label>Voucher Type</label>

            <select name="voucherType"
                    id="voucherType"
                    class="form-select"
                    onchange="validateVoucherType()">

                <option value="Purchase">

                    Purchase

                </option>

            </select>

            <div id="voucherTypeError"
                 class="error-message"></div>

        </div>

        <!-- CUSTOMER -->

        <div class="mb-4">

            <label>Customer Name</label>

            <select name="customerId"
                    id="customerId"
                    class="form-select"
                    onchange="validateCustomer()">

                <option value="">

                    Select Customer

                </option>

                <c:forEach var="c"
                           items="${customers}">

                    <option value="${c.id}">

                        ${c.customerName}

                    </option>

                </c:forEach>

            </select>

            <div id="customerError"
                 class="error-message"></div>

        </div>

        <!-- PRODUCT GROUP -->

        <div class="mb-4">

            <label>Product Group Name</label>

            <select name="productGroupId"
                    id="productGroup"
                    class="form-select"
                    onchange="validateProductGroup()">

                <option value="">

                    Select Product Group

                </option>

                <c:forEach var="group"
                           items="${productGroups}">

                    <option value="${group.id}">

                        ${group.productName}

                    </option>

                </c:forEach>

            </select>

            <div id="productGroupError"
                 class="error-message"></div>

        </div>

        <!-- MAKE MODEL -->

        <div class="row g-4">

            <div class="col-md-4">

                <label>Make</label>

                <input name="make"
                       id="make"
                       class="form-control"
                       onchange="validateMake()">

                <div id="makeError"
                     class="error-message"></div>

            </div>

            <div class="col-md-4">

                <label>Model</label>

                <input name="model"
                       id="model"
                       class="form-control"
                       onchange="validateModel()">

                <div id="modelError"
                     class="error-message"></div>

            </div>

            <div class="col-md-4">

                <label>Product Code</label>

                <input name="productCode"
                       id="productCode"
                       class="form-control"
                       onchange="validateProductCode()">

                <div id="productCodeError"
                     class="error-message"></div>

            </div>

        </div>

        <!-- ITEM -->

        <div class="mb-4 mt-4">

            <label>Item Name</label>

            <input name="itemName"
                   id="itemName"
                   class="form-control"
                   onchange="validateItemName()">

            <div id="itemNameError"
                 class="error-message"></div>

        </div>

        <!-- PRICE -->

        <div class="row g-4">

            <div class="col-md-4">

                <label>Opening Value</label>

                <input type="number"
                       name="openingValue"
                       id="openingValue"
                       class="form-control"
                       onchange="validateOpeningValue()">

                <div id="openingValueError"
                     class="error-message"></div>

            </div>

            <div class="col-md-4">

                <label>Opening Balance</label>

                <input type="number"
                       name="openingBalance"
                       id="openingBalance"
                       class="form-control"
                       onchange="validateOpeningBalance()">

                <div id="openingBalanceError"
                     class="error-message"></div>

            </div>

            <div class="col-md-4">

                <label>Purchase Price</label>

                <input type="number"
                       name="purchasePrice"
                       id="purchasePrice"
                       class="form-control"
                       onchange="validatePurchasePrice()">

                <div id="purchasePriceError"
                     class="error-message"></div>

            </div>

        </div>

        <!-- DATE -->

        <div class="mb-4 mt-4">

            <label>Order Due Date</label>

            <input type="date"
                   name="orderDueDate"
                   id="orderDueDate"
                   class="form-control"
                   onchange="validateOrderDate()">

            <div id="orderDateError"
                 class="error-message"></div>

        </div>

        <button type="submit"
                class="btn btn-primary w-100">

            Order Purchase

        </button>

    </form>

    </div>

    </main>

    <footer>

        <span id="dateTime"
              class="date-time"></span>

        <p>

            © 2025 E-commerce Portal

        </p>

    </footer>

    <script>

    function setError(field,errorId,message){

        field.classList.add("input-error");
        field.classList.remove("input-success");

        document.getElementById(errorId).style.display="block";
        document.getElementById(errorId).innerHTML=message;
    }

    function setSuccess(field,errorId){

        field.classList.remove("input-error");
        field.classList.add("input-success");

        document.getElementById(errorId).style.display="none";
    }

    function validateVoucherType(){

        let field=document.getElementById("voucherType");

        if(field.value===""){

            setError(field,
                     "voucherTypeError",
                     "Select Voucher Type");

            return false;
        }

        setSuccess(field,"voucherTypeError");

        return true;
    }

    function validateCustomer(){

        let field=document.getElementById("customerId");

        if(field.value===""){

            setError(field,
                     "customerError",
                     "Select Customer");

            return false;
        }

        setSuccess(field,"customerError");

        return true;
    }

    function validateProductGroup(){

        let field=document.getElementById("productGroup");

        if(field.value===""){

            setError(field,
                     "productGroupError",
                     "Select Product Group");

            return false;
        }

        setSuccess(field,"productGroupError");

        return true;
    }

    function validateMake(){

        let field=document.getElementById("make");

        if(field.value.trim()===""){

            setError(field,
                     "makeError",
                     "Enter Make");

            return false;
        }

        setSuccess(field,"makeError");

        return true;
    }

    function validateModel(){

        let field=document.getElementById("model");

        if(field.value.trim()===""){

            setError(field,
                     "modelError",
                     "Enter Model");

            return false;
        }

        setSuccess(field,"modelError");

        return true;
    }

    function validateProductCode(){

        let field=document.getElementById("productCode");

        if(field.value.trim()===""){

            setError(field,
                     "productCodeError",
                     "Enter Product Code");

            return false;
        }

        setSuccess(field,"productCodeError");

        return true;
    }

    function validateItemName(){

        let field=document.getElementById("itemName");

        if(field.value.trim()===""){

            setError(field,
                     "itemNameError",
                     "Enter Item Name");

            return false;
        }

        setSuccess(field,"itemNameError");

        return true;
    }

    function validateOpeningValue(){

        let field=document.getElementById("openingValue");

        if(field.value==="" || field.value<=0){

            setError(field,
                     "openingValueError",
                     "Enter Valid Opening Value");

            return false;
        }

        setSuccess(field,"openingValueError");

        return true;
    }

    function validateOpeningBalance(){

        let field=document.getElementById("openingBalance");

        if(field.value==="" || field.value<=0){

            setError(field,
                     "openingBalanceError",
                     "Enter Valid Opening Balance");

            return false;
        }

        setSuccess(field,"openingBalanceError");

        return true;
    }

    function validatePurchasePrice(){

        let field=document.getElementById("purchasePrice");

        if(field.value==="" || field.value<=0){

            setError(field,
                     "purchasePriceError",
                     "Enter Valid Purchase Price");

            return false;
        }

        setSuccess(field,"purchasePriceError");

        return true;
    }

    function validateOrderDate(){

        let field=document.getElementById("orderDueDate");

        if(field.value===""){

            setError(field,
                     "orderDateError",
                     "Select Order Date");

            return false;
        }

        setSuccess(field,"orderDateError");

        return true;
    }

    function validateForm(){

        return validateVoucherType() &&
               validateCustomer() &&
               validateProductGroup() &&
               validateMake() &&
               validateModel() &&
               validateProductCode() &&
               validateItemName() &&
               validateOpeningValue() &&
               validateOpeningBalance() &&
               validatePurchasePrice() &&
               validateOrderDate();
    }

    function updateDateTime(){

        const el=document.getElementById("dateTime");

        if(el){

            el.textContent=
                new Date().toLocaleString();
        }
    }

    setInterval(updateDateTime,1000);

    updateDateTime();

    document.querySelectorAll(
    'input[name="make"],input[name="model"],input[name="productCode"]'
    ).forEach(input=>{

        input.addEventListener('input',()=>{

            const make=
                document.querySelector('input[name="make"]').value;

            const model=
                document.querySelector('input[name="model"]').value;

            const productCode=
                document.querySelector('input[name="productCode"]').value;

            document.querySelector('input[name="itemName"]').value=
                make+' '+model+' ('+productCode+')';
        });
    });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>