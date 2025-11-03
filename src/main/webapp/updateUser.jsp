<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>User Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
  <div class="container py-4">
    <h3 class="mb-4">User Form</h3>

    <form id="userForm" class="row g-3 needs-validation" novalidate>
      <!-- hidden id -->
      <input type="hidden" id="id" name="id" />

      <div class="col-md-6">
        <label for="firstName" class="form-label">First Name</label>
        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="John" required />
        <div class="invalid-feedback">First name is required.</div>
      </div>

      <div class="col-md-6">
        <label for="lastName" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Doe" required />
        <div class="invalid-feedback">Last name is required.</div>
      </div>

      <div class="col-md-6">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required />
        <div class="invalid-feedback">Enter a valid email.</div>
      </div>

      <div class="col-md-6">
        <label for="phone" class="form-label">Phone</label>
        <input type="tel" class="form-control" id="phone" name="phone" placeholder="+1234567890" required />
        <div class="invalid-feedback">Phone number is required.</div>
      </div>

      <div class="col-md-6">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Password" minlength="6" required />
        <div class="invalid-feedback">Password (min 6 characters) is required.</div>
      </div>

      <div class="col-md-6">
        <label for="role" class="form-label">Role</label>
        <select class="form-select" id="role" name="role" required>
          <option value="">Choose...</option>
          <option value="USER">USER</option>
          <option value="ADMIN">ADMIN</option>
        </select>
        <div class="invalid-feedback">Please select a role.</div>
      </div>

      <div class="col-md-4">
        <label for="failedAttempts" class="form-label">Failed Attempts</label>
        <input type="number" class="form-control" id="failedAttempts" name="failedAttempts" min="0" value="0" />
      </div>

      <div class="col-md-4">
        <label for="lockTime" class="form-label">Lock Time</label>
        <input type="datetime-local" class="form-control" id="lockTime" name="lockTime" />
      </div>

      <div class="col-md-4">
        <label for="otp" class="form-label">OTP</label>
        <input type="text" class="form-control" id="otp" name="otp" placeholder="One-time code" />
      </div>

      <div class="col-12">
        <button class="btn btn-primary" type="submit">Save</button>
        <button class="btn btn-secondary ms-2" type="reset">Reset</button>
      </div>
    </form>
  </div>

  <script>
    // Bootstrap validation helper
    (function () {
      'use strict'
      const forms = document.querySelectorAll('.needs-validation')
      Array.from(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
    })()
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
