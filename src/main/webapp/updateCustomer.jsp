<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Page</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<style>

body{
margin:0;
font-family:Arial;
background:#f5f5f5;
}

.navbar{
position:fixed;
top:0;
left:0;
width:100%;
z-index:1050;
}

.sidebar{
position:fixed;
top:56px;
left:0;
width:250px;
height:calc(100vh - 56px);
background:black;
color:white;
padding:15px;
overflow-y:auto;
}

.sidebar a{
color:#ddd;
text-decoration:none;
}

.sidebar a:hover{
color:white;
}

main{
margin-top:70px;
margin-left:260px;
padding:20px;
background:white;
min-height:calc(100vh - 70px);
}

footer{
background:black;
color:white;
position:fixed;
bottom:0;
left:0;
width:100%;
height:50px;
display:flex;
align-items:center;
justify-content:center;
}

footer .date-time{
position:absolute;
right:20px;
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container-fluid">

<a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>

<div class="collapse navbar-collapse justify-content-end">

<ul class="navbar-nav">

<li class="nav-item dropdown">

<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">

<i class="bi bi-person-circle"></i> Admin

</a>

<ul class="dropdown-menu dropdown-menu-end">

<li>
<a class="dropdown-item" href="logOut">Logout</a>
</li>

</ul>

</li>

</ul>

</div>

</div>
</nav>

<!-- Sidebar -->

<div class="sidebar border-end">

<h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>

<ul class="list-unstyled">

<li class="mb-2">

<a href="addCustomerPage" class="d-block py-2 px-3 text-white rounded">

<i class="bi bi-person-plus"></i> Add Customer

</a>

</li>

<li class="mb-2">

<a href="getAllCustomers" class="d-block py-2 px-3 text-white rounded">

<i class="bi bi-people"></i> View Customers

</a>

</li>

<li class="mb-2">

<a href="viewUser" class="d-block py-2 px-3 text-white rounded">

<i class="bi bi-person"></i> View User

</a>

</li>

</ul>

</div>

<!-- Main -->

<main>

<h4 class="text-center mb-4">Update Customer</h4>
<form class="row g-3" action="updateCustomerById" method="post">

<input type="hidden" name="id" value="${customer.id}">

<div class="col-md-6">

<label class="form-label">Customer Name</label>
<input type="text" class="form-control" name="customerName"
value="${customer.customerName}" required>

<label class="form-label mt-3">Customer Type</label>

<select class="form-select" name="customerType">

<option value="">Select Type</option>

<option value="creditor"
<c:if test="${customer.customerType=='creditor'}">selected</c:if>>
Creditor
</option>

<option value="debtor"
<c:if test="${customer.customerType=='debtor'}">selected</c:if>>
Debtor
</option>

</select>

<label class="form-label mt-3">Email</label>
<input type="email" class="form-control"
name="email"
value="${customer.email}" required>

<label class="form-label mt-3">Contact Number</label>
<input type="text" class="form-control"
name="contactNumber"
value="${customer.contactNumber}" required>

<label class="form-label mt-3">GST Number</label>
<input type="text" class="form-control"
name="gstNumber"
value="${customer.gstNumber}">

<label class="form-label mt-3">Country</label>
<input type="text" class="form-control"
name="country"
value="India" readonly>

</div>

<div class="col-md-6">

<label class="form-label">Pin Code</label>

<input type="text"
id="pinCode"
class="form-control"
name="pinCode"
value="${customer.pinCode}"
onchange="checkPinCode()"
required>

<div id="stateCityError" class="text-danger"></div>

<label class="form-label mt-3">State</label>

<select class="form-select" id="state" name="state">

<option selected>${customer.state}</option>

</select>

<label class="form-label mt-3">City</label>

<input type="text"
id="city"
class="form-control"
name="city"
value="${customer.city}">

<label class="form-label mt-3">Billing Address</label>

<input type="text"
class="form-control"
id="billingAddress"
name="billingAddress"
value="${customer.billingAddress}">

<label class="form-label mt-3">Shipping Address</label>

<input type="text"
class="form-control"
id="shippingAddress"
name="shippingAddress"
value="${customer.shippingAddress}">

<label class="form-label mt-3">Same as Billing?</label>

<div>

<input type="radio" name="sameAddress" value="yes" id="sameYes">

<label for="sameYes">Yes</label>

<input type="radio" name="sameAddress" value="no" id="sameNo">

<label for="sameNo">No</label>

</div>

</div>

<div class="col-12 mt-3">

<label class="form-label">Payment Mode</label>

<div class="form-check form-check-inline">

<input class="form-check-input"
type="radio"
name="paymentMode"
value="online"
<c:if test="${customer.paymentMode=='online'}">checked</c:if>>

<label class="form-check-label">Online</label>

</div>

<div class="form-check form-check-inline">

<input class="form-check-input"
type="radio"
name="paymentMode"
value="cash"
<c:if test="${customer.paymentMode=='cash'}">checked</c:if>>

<label class="form-check-label">Cash</label>

</div>

<div class="form-check form-check-inline">

<input class="form-check-input"
type="radio"
name="paymentMode"
value="cheque"
<c:if test="${customer.paymentMode=='cheque'}">checked</c:if>>

<label class="form-check-label">Cheque</label>

</div>

</div>

<div class="col-12 text-center mt-4">

<button type="submit" class="btn btn-primary">Update</button>

</div>

</form>

</main>

<footer>

<span id="dateTime" class="date-time"></span>

<p>&copy; 2025 E-Commerce Portal</p>

</footer>

<script>

function updateDateTime(){
document.getElementById("dateTime").innerText =
new Date().toLocaleString();
}

setInterval(updateDateTime,1000);

async function checkPinCode(){

const pin=document.getElementById("pinCode").value;
const error=document.getElementById("stateCityError");
const state=document.getElementById("state");
const city=document.getElementById("city");

error.innerHTML="";

if(pin.length!=6){
error.innerHTML="Enter valid pincode";
return;
}

try{

const response=
await axios.get(`https://api.postalpincode.in/pincode/${pin}`);

const data=response.data;

if(data[0].Status=="Success"){

state.innerHTML=
`<option>${data[0].PostOffice[0].State}</option>`;

city.value=data[0].PostOffice[0].District;

}

}catch(e){

error.innerHTML="Failed to fetch pincode";

}

}

document.getElementById("sameYes")
.addEventListener("change",function(){

document.getElementById("shippingAddress").value=
document.getElementById("billingAddress").value;

document.getElementById("shippingAddress").readOnly=true;

});

document.getElementById("sameNo")
.addEventListener("change",function(){

document.getElementById("shippingAddress").readOnly=false;

});

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>