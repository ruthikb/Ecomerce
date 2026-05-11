<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1"/>
 <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
<title>Create Sales Order</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

:root{
    --primary:#0f172a;
    --secondary:#1e293b;
    --accent:#2563eb;
    --success:#22c55e;
    --danger:#ef4444;
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
    padding:12px 25px;
}

.navbar-brand{
    color:white!important;
    font-size:26px;
    font-weight:700;
}

.nav-link{
    color:white!important;
}

.sidebar{
    position:fixed;
    top:75px;
    left:20px;
    width:270px;
    height:calc(100vh - 100px);
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border-radius:30px;
    padding:25px;
    border:1px solid rgba(255,255,255,0.1);
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    overflow-y:auto;
}

.sidebar-title{
    text-align:center;
    font-size:28px;
    font-weight:700;
    margin-bottom:30px;
}

.menu-card{
    background:rgba(255,255,255,0.05);
    border-radius:20px;
    margin-bottom:20px;
    overflow:hidden;
}

.menu-toggle{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 20px;
    text-decoration:none;
    color:white;
    font-weight:600;
}

.sub-menu{
    padding:10px 15px 15px;
}

.sub-menu a{
    display:block;
    padding:12px 15px;
    margin-bottom:10px;
    border-radius:15px;
    text-decoration:none;
    color:#dbeafe;
    background:rgba(255,255,255,0.04);
}

.main-content{
    margin-left:310px;
    margin-top:100px;
    padding:30px;
    padding-bottom:100px;
}

.hero-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:35px;
    padding:35px;
    border:1px solid rgba(255,255,255,0.1);
    margin-bottom:35px;
}

.hero-title{
    font-size:42px;
    font-weight:700;
}

.hero-text{
    color:#dbeafe;
}

.form-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:35px;
    padding:40px;
    border:1px solid rgba(255,255,255,0.1);
}

.form-label{
    font-weight:600;
    margin-bottom:8px;
    color:white;
}

.form-control,
.form-select{
    height:55px;
    border:none;
    border-radius:18px;
    background:rgba(255,255,255,0.1);
    color:white;
    padding:0 18px;
}

.form-control:focus,
.form-select:focus{
    background:rgba(255,255,255,0.16);
    border:1px solid #60a5fa;
    box-shadow:none;
    color:white;
}

.form-control::placeholder{
    color:#dbeafe;
}

option{
    color:black;
}

.total-card{
    background:linear-gradient(45deg,#2563eb,#60a5fa);
    border-radius:25px;
    padding:25px;
    margin-top:25px;
    text-align:center;
}

.total-card h2{
    font-size:38px;
    font-weight:700;
}

.submit-btn{
    width:100%;
    height:58px;
    border:none;
    border-radius:18px;
    background:linear-gradient(45deg,#22c55e,#4ade80);
    color:white;
    font-size:18px;
    font-weight:700;
    margin-top:25px;
}

.error{
    color:#ffb3b3;
    font-size:13px;
    margin-top:5px;
    display:none;
}

.input-error{
    border:2px solid #ef4444 !important;
}

.input-success{
    border:2px solid #22c55e !important;
}

footer{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(10px);
    border-top:1px solid rgba(255,255,255,0.1);
    color:white;
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
    height:60px;
    display:flex;
    align-items:center;
    justify-content:center;
}

footer .date-time{
    position:absolute;
    right:20px;
    color:#93c5fd;
}

</style>

</head>

<body>

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

                    <a class="nav-link dropdown-toggle"
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

        Sales Menu

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

        <div class="collapse sub-menu"
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
<div class="main-content">

    <div class="hero-card">

        <h1 class="hero-title">

            Create Sales Order

        </h1>

        <p class="hero-text">

            Manage customer sales orders efficiently.

        </p>

    </div>

    <div class="form-card">

        <form action="saveSalesOrder"
              method="post"
              onsubmit="return validateForm()">

            <!-- ROW 1 -->

            <div class="row g-4">

                <div class="col-md-6">

                    <label class="form-label">

                        Voucher Type

                    </label>

                    <select name="voucherType"
                            class="form-select"
                            id="voucherType"
                            onchange="validateVoucherType()">

                        <option value="Sales">

                            Sales

                        </option>

                    </select>

                    <div id="voucherTypeError"
                         class="error"></div>

                </div>

                <div class="col-md-6">

                    <label class="form-label">

                        Customer Name

                    </label>

                    <select name="customerId"
                            class="form-select"
                            id="customerId"
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
                         class="error"></div>

                </div>

            </div>

            <!-- ROW 2 -->

            <div class="row g-4 mt-1">

                <div class="col-md-4">

                    <label class="form-label">

                        Product Group

                    </label>

                    <select name="productGroupId"
                            class="form-select"
                            id="productGroup"
                            onchange="validateProductGroup()">

                        <option value="">

                            Select Product Group

                        </option>

                        <c:forEach var="group"
                                   items="${productGroups}">

                            <option value="${group}">

                                ${group}

                            </option>

                        </c:forEach>

                    </select>

                    <div id="productGroupError"
                         class="error"></div>

                </div>

                <div class="col-md-4">

                    <label class="form-label">

                        Email

                    </label>

                    <input type="email"
                           name="email"
                           id="email"
                           class="form-control"
                           placeholder="Enter email"
                           onchange="validateEmail()">

                    <div id="emailError"
                         class="error"></div>

                </div>

                <div class="col-md-4">

                    <label class="form-label">

                        Brand

                    </label>

                    <input type="text"
                           name="brand"
                           id="brand"
                           class="form-control"
                           placeholder="Enter brand"
                           onchange="validateBrand()">

                    <div id="brandError"
                         class="error"></div>

                </div>

            </div>

            <!-- ROW 3 -->

            <div class="row g-4 mt-1">

                <div class="col-md-4">

                    <label class="form-label">

                        Model

                    </label>

                    <input type="text"
                           name="model"
                           id="model"
                           class="form-control"
                           placeholder="Enter model"
                           onchange="validateModel()">

                    <div id="modelError"
                         class="error"></div>

                </div>

                <div class="col-md-4">

                    <label class="form-label">

                        Selling Price

                    </label>

                    <input type="number"
                           step="0.01"
                           id="price"
                           name="sellingPrice"
                           class="form-control"
                           placeholder="Enter price"
                           onchange="validatePrice()">

                    <div id="priceError"
                         class="error"></div>

                </div>

                <div class="col-md-4">

                    <label class="form-label">

                        Quantity

                    </label>

                    <input type="number"
                           id="qty"
                           name="quantity"
                           class="form-control"
                           placeholder="Enter quantity"
                           onchange="validateQuantity()">

                    <div id="qtyError"
                         class="error"></div>

                </div>

            </div>

            <!-- ROW 4 -->

            <div class="row g-4 mt-1">

                <div class="col-md-6">

                    <label class="form-label">

                        Total Amount

                    </label>

                    <input type="number"
                           id="total"
                           name="totalAmount"
                           class="form-control"
                           readonly>

                </div>

                <div class="col-md-6">

                    <label class="form-label">

                        Sales Date

                    </label>

                    <input type="date"
                           name="salesDate"
                           id="salesDate"
                           class="form-control"
                           onchange="validateSalesDate()">

                    <div id="salesDateError"
                         class="error"></div>

                </div>

            </div>

            <div class="total-card">

                <p>Total Sales Amount</p>

                <h2 id="totalDisplay">

                    ₹ 0.00

                </h2>

            </div>

            <button type="submit"
                    class="submit-btn">

                <i class="bi bi-check-circle-fill"></i>

                Create Sales Order

            </button>

        </form>

    </div>

</div>

<footer>

    <span id="dateTime"
          class="date-time"></span>

    <p>
        © 2026 Vendor Management System
    </p>

</footer>

<script>

function setError(id,message,field){

    document.getElementById(id).style.display="block";
    document.getElementById(id).innerHTML=message;

    field.classList.add("input-error");
    field.classList.remove("input-success");
}

function setSuccess(id,field){

    document.getElementById(id).style.display="none";

    field.classList.remove("input-error");
    field.classList.add("input-success");
}

function validateVoucherType(){

    let field=document.getElementById("voucherType");

    if(field.value===""){

        setError("voucherTypeError",
                 "Select Voucher Type",
                 field);

        return false;
    }

    setSuccess("voucherTypeError",field);

    return true;
}

function validateCustomer(){

    let field=document.getElementById("customerId");

    if(field.value===""){

        setError("customerError",
                 "Select Customer",
                 field);

        return false;
    }

    setSuccess("customerError",field);

    return true;
}

function validateProductGroup(){

    let field=document.getElementById("productGroup");

    if(field.value===""){

        setError("productGroupError",
                 "Select Product Group",
                 field);

        return false;
    }

    setSuccess("productGroupError",field);

    return true;
}

function validateEmail(){

    let field=document.getElementById("email");

    let value=field.value.trim();

    let pattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(value===""){

        setError("emailError",
                 "Email is required",
                 field);

        return false;
    }

    if(!pattern.test(value)){

        setError("emailError",
                 "Enter valid email",
                 field);

        return false;
    }

    setSuccess("emailError",field);

    return true;
}

function validateBrand(){

    let field=document.getElementById("brand");

    if(field.value.trim()===""){

        setError("brandError",
                 "Brand is required",
                 field);

        return false;
    }

    setSuccess("brandError",field);

    return true;
}

function validateModel(){

    let field=document.getElementById("model");

    if(field.value.trim()===""){

        setError("modelError",
                 "Model is required",
                 field);

        return false;
    }

    setSuccess("modelError",field);

    return true;
}

function validatePrice(){

    let field=document.getElementById("price");

    let value=parseFloat(field.value);

    if(isNaN(value) || value<=0){

        setError("priceError",
                 "Enter valid price",
                 field);

        return false;
    }

    setSuccess("priceError",field);

    calculateTotal();

    return true;
}

function validateQuantity(){

    let field=document.getElementById("qty");

    let value=parseInt(field.value);

    if(isNaN(value) || value<=0){

        setError("qtyError",
                 "Enter valid quantity",
                 field);

        return false;
    }

    setSuccess("qtyError",field);

    calculateTotal();

    return true;
}

function validateSalesDate(){

    let field=document.getElementById("salesDate");

    if(field.value===""){

        setError("salesDateError",
                 "Select sales date",
                 field);

        return false;
    }

    setSuccess("salesDateError",field);

    return true;
}

function calculateTotal(){

    const price=
        parseFloat(document.getElementById("price").value)||0;

    const qty=
        parseInt(document.getElementById("qty").value)||0;

    const result=
        (price*qty).toFixed(2);

    document.getElementById("total").value=result;

    document.getElementById("totalDisplay").innerText=
        "₹ "+result;
}

function validateForm(){

    return validateVoucherType() &&
           validateCustomer() &&
           validateProductGroup() &&
           validateEmail() &&
           validateBrand() &&
           validateModel() &&
           validatePrice() &&
           validateQuantity() &&
           validateSalesDate();
}

function updateDateTime(){

    document.getElementById("dateTime").textContent=
        new Date().toLocaleString();
}

setInterval(updateDateTime,1000);

updateDateTime();

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>