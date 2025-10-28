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
                            <li><a class="dropdown-item" href="updateAdminProfile">Edit-Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
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
                <a href="getAllCustomers"
                    class="d-block py-2 px-3 text-white rounded hover-item">
                    <i class="bi bi-people me-2"></i> View Customers
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
                    <label class="form-label">State</label>
                    <select class="form-select" id="stateSelect" name="state" required>
                        <option value="">Select State</option>
                    </select>

                    <label class="form-label mt-3">City</label>
                    <select class="form-select" id="citySelect" name="city" required>
                        <option value="">Select City</option>
                    </select>
                    <div id="stateCityError" class="text-danger small mt-2"></div>

                    <label class="form-label mt-3">Pin Code</label>
                    <input type="text" class="form-control" name="pinCode">

                    <label class="form-label mt-3">Address</label>
                    <input type="text" class="form-control" name="address">

                    <label class="form-label mt-3">Billing Address</label>
                    <input type="text" class="form-control" name="billingAddress" id="billingAddress">
                </div>

                <div class="col-12 mt-3">
                    <label class="form-label">Do you want shipping address same as billing address?</label>
                    <div>
                        <input type="radio" name="sameAddress" value="yes" id="sameYes">
                        <label for="sameYes">Yes</label>
                        <input type="radio" name="sameAddress" value="no" id="sameNo" class="ms-3">
                        <label for="sameNo">No</label>
                    </div>

                    <label class="form-label mt-3">Shipping Address</label>
                    <input type="text" class="form-control" name="shippingAddress" id="shippingAddress">
                </div>

                <div class="col-12 mt-3">
                    <label class="form-label">Payment Mode</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="paymentMode" value="online" id="online">
                        <label class="form-check-label" for="online">Online</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="paymentMode" value="cash" id="cash">
                        <label class="form-check-label" for="cash">Cash</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="paymentMode" value="cheque" id="cheque">
                        <label class="form-check-label" for="cheque">Cheque</label>
                    </div>
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

        document.addEventListener('DOMContentLoaded', function() {
            const stateSelect = document.getElementById('stateSelect');
            const citySelect = document.getElementById('citySelect');
            const errorDiv = document.getElementById('stateCityError');


            fetch('https://countriesnow.space/api/v0.1/countries/states', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    country: 'India'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    throw new Error(data.msg);
                }
                
                stateSelect.innerHTML = '<option value="">Select State</option>';
                data.data.states.forEach(state => {
                    const option = document.createElement('option');
                    option.value = state.name;
                    option.textContent = state.name;
                    stateSelect.appendChild(option);
                });
            })
            .catch(error => {
                errorDiv.textContent = 'Error loading states. Please try again.';
                console.error('Error:', error);
            });


            stateSelect.addEventListener('change', function() {
                const selectedState = this.value;
                if (selectedState) {
                    fetch('https://countriesnow.space/api/v0.1/countries/state/cities', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            country: 'India',
                            state: selectedState
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.error) {
                            throw new Error(data.msg);
                        }
                        
                        citySelect.innerHTML = '<option value="">Select City</option>';
                        data.data.forEach(city => {
                            const option = document.createElement('option');
                            option.value = city;
                            option.textContent = city;
                            citySelect.appendChild(option);
                        });
                        citySelect.disabled = false;
                    })
                    .catch(error => {
                        errorDiv.textContent = 'Error loading cities. Please try again.';
                        console.error('Error:', error);
                    });
                } else {
                    citySelect.innerHTML = '<option value="">Select City</option>';
                    citySelect.disabled = true;
                }
            });


            const sameYes = document.getElementById('sameYes');
            const sameNo = document.getElementById('sameNo');
            const shippingAddress = document.getElementById('shippingAddress');
            const billingAddress = document.getElementById('billingAddress');

            sameYes.addEventListener('change', function() {
                if (this.checked) {
                    shippingAddress.value = billingAddress.value;
                    shippingAddress.readOnly = true;
                }
            });

            sameNo.addEventListener('change', function() {
                if (this.checked) {
                    shippingAddress.readOnly = false;
                    shippingAddress.value = '';
                }
            });

            billingAddress.addEventListener('input', function() {
                if (sameYes.checked) {
                    shippingAddress.value = this.value;
                }
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>