<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin-Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }


        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1050;
        }


        .sidebar {
            position: fixed;
            top: 56px;

            left: 0;
            width: 250px;
            height: calc(100vh - 56px);
            background-color: #000;
            color: white;
            padding: 15px;
            overflow-y: auto;
        }

        .sidebar a {
            color: #ddd;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: #fff;
        }


        main {
            margin-top: 70px;
            margin-left: 260px;

            padding: 20px;
            background-color: #fff;
            min-height: calc(100vh - 70px);
        }


        footer {
            background-color: black;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9em;
            z-index: 1050;
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

        body {
            overflow-y: auto;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="Admin.jsp">E-Commerce Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> Admin Name
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">

                            <li><a class="dropdown-item" href="logOut">Log-Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="sidebar bg-dark p-3 border-end">
        <h5 class="text-center border-bottom pb-2 mb-3">Menu</h5>
        <ul class="list-unstyled">
            <li class="mb-2">
                <a href="addCustomerPage" class="d-block py-2 px-3 text-white rounded hover-item">
                    <i class="bi bi-person-plus me-2"></i> Add Customer
                </a>
            </li>
            <li class="mb-2">
                <a href="getAllCustomers" class="d-block py-2 px-3 text-white rounded hover-item">
                    <i class="bi bi-people me-2"></i> View Customers
                </a>
            </li>
            <li class="mb-2">
                           <a href="viewUser" class="d-block py-2 px-3 text-white rounded hover-item">
                           <i class="bi bi-people me-2"></i> View User
                           </a>
                           </li>
        </ul>
    </div>
    <main>
        <div class="container bg-white p-4 rounded shadow">
            <h4 class="text-center mb-4">Add Customer</h4>

            <form class="row g-3" action="addCustomer" method="post">

                <div class="col-md-6">
                    <label class="form-label">Customer Name</label>
                    <input type="text" class="form-control" name="customerName" required>

                    <label class="form-label mt-3">Customer Type</label>
                    <select class="form-select" name="customerType" required>
                        <option value="">Select Type</option>
                        <option value="creditor">Creditor</option>
                        <option value="debtor">Debtor</option>
                    </select>

                    <label class="form-label mt-3">Email</label>
                    <input type="email" class="form-control" name="email">

                    <label class="form-label mt-3">Contact Number</label>
                    <input type="text" class="form-control" name="contactNumber">

                    <label class="form-label mt-3">GST Number</label>
                    <input type="text" class="form-control" name="gstNumber">

                    <label class="form-label mt-3">Country</label>
                    <input type="text" class="form-control" name="country" value="India" readonly>
                </div>

                <div class="col-md-6">
                    <label for="pinCode" class="form-label">PinCode</label>
                    <input type="text" class="form-control" name="pinCode" id="pinCode" placeholder="Enter pincode"
                        onchange="checkPinCode()">
                    <span id="pinCodeError" class="text-danger"></span>
                    <label for="state" class="form-label">State</label>
                    <select class="form-select" name="state" id="state">
                        <option selected disabled>Select State</option>
                    </select>
                    <label for="city" class="form-label mt-3">City</label>
                    <input type="text" class="form-control" name="city" id="city" placeholder="Enter city">

                    <label class="form-label">Do you want shipping address same as billing address?</label>
                    <div>
                        <input type="radio" name="sameAddress" value="yes" id="sameYes">
                        <label for="sameYes">Yes</label>
                        <input type="radio" name="sameAddress" value="no" id="sameNo" class="ms-3">
                        <label for="sameNo">No</label>
                    </div>

                    <label class="form-label mt-3">Shipping Address</label>
                    <input type="text" class="form-control" name="shippingAddress" id="shippingAddress">
                    <label class="form-label mt-3">Address</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="Enter address"
                        required>
                </div>

                <div class="col-12 mt-3">
                    <label class="form-label mt-3">Billing Address</label>
                    <input type="text" class="form-control" name="billingAddress" id="billingAddress"
                        placeholder="Enter billing address" required>
                </div>

                <div class="col-12 mt-3">
                    <label class="form-label">Payment Mode</label>
                    <select class="form-select" name="paymentMode" required>
                        <option value="">Select Payment Mode</option>
                        <option value="online">Online</option>
                        <option value="cash">Cash</option>
                        <option value="cheque">Cheque</option>
                    </select>

                </div>

                <div class="col-12 text-center mt-4">
                    <button type="submit" class="btn btn-primary px-4">Submit</button>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <span id="dateTime" class="date-time"></span>
        <p>&copy; 2025 E-commerce Portal | e-Portal</p>
    </footer>

    <script>

        function updateDateTime() {
            document.getElementById("dateTime").textContent = new Date().toLocaleString();
        }
        setInterval(updateDateTime, 1000);
        updateDateTime();

        async function checkPinCode() {
            const pinCode = document.getElementById('pinCode').value.trim();
            const errorId = document.getElementById('pinCodeError');
            const stateSelect = document.getElementById('state');
            const cityInput = document.getElementById('city');

            // Clear previous errors and reset fields
            errorId.innerHTML = '';
            stateSelect.innerHTML = '<option selected disabled>Loading states...</option>';
            cityInput.value = '';

            if (pinCode.length !== 6 || isNaN(pinCode)) {
                errorId.innerHTML = "Please enter a valid 6-digit pinCode.";
                return;
            }
            try {
                const response = await axios.get(`https://api.postalpincode.in/pincode/${pinCode}`);
                const data = response.data;

                if (data[0].Status === "Success" && data[0].PostOffice.length > 0) {
                    const office = data[0].PostOffice[0];
                    stateSelect.innerHTML = `<option selected>${office.State}</option>`;
                    cityInput.value = office.District;
                } else {
                    errorId.innerHTML = "No data found for this pincode.";
                }
            } catch (error) {
                errorId.innerHTML = "Failed to fetch data. Try again later.";
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const sameYesRadio = document.getElementById('sameYes');
            const sameNoRadio = document.getElementById('sameNo');
            const billingAddressInput = document.getElementById('billingAddress');
            const shippingAddressInput = document.getElementById('shippingAddress');

            function handleAddressChange() {
                if (sameYesRadio.checked) {
                    shippingAddressInput.value = billingAddressInput.value;
                    shippingAddressInput.setAttribute('readonly', true);
                } else {
                    shippingAddressInput.value = '';
                    shippingAddressInput.removeAttribute('readonly');
                }
            }

           
            sameYesRadio.addEventListener('change', handleAddressChange);
            sameNoRadio.addEventListener('change', handleAddressChange);

         
            billingAddressInput.addEventListener('input', function() {
                if (sameYesRadio.checked) {
                    shippingAddressInput.value = billingAddressInput.value;
                }
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>