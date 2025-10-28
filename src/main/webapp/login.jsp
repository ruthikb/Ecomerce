<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
        :root {
            --primary: #000b0a;
            --secondary: #000a08;
            --light: #F1F8E9;
            --accent: #000807;
            --text: #f5f5f5;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--light);
            color: var(--text);
            overflow-x: hidden;
        }


        header {
            background-color: var(--primary);
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        header h1 {
            font-size: 1.6em;
            cursor: pointer;
        }

        nav a {
            text-decoration: none;
            color: white;
            margin-left: 30px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: var(--accent);
        }


        main {
            margin-top: 90px;
            margin-bottom: 90px;
            padding: 40px;
            min-height: 80vh;
        }

        .hero {
            background-color: white;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .hero h2 {
            color: var(--secondary);
            font-size: 2em;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.1em;
            color: #444;
            margin-bottom: 30px;
        }

        .btn {
            background-color: var(--accent);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: var(--secondary);
        }

        footer {

            background-color: var(--secondary);
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9em    ;
            padding: 0 20px;
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

        .laptop-section {
            margin-top: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            border-radius: 10px;
        }

        .card h4 {
            margin-top: 10px;
            color: var(--primary);
        }
    </style>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
<header>
    <h1>ecomerce Portal</h1>

</header>
  <div class="card shadow-lg p-4" style="width: 24rem;">
    <h4 class="text-center mb-3">Sign in to your account</h4>
    <form action="loginUser" method="post">
      <div class="mb-3">
        <label for="identifier" class="form-label">Email or Phone number</label>
        <input type="text" class="form-control" id="identifier" name="emailOrPhone" placeholder="you@example.com or 9876543210" required>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Enter the Password</label>
        <div class="input-group">
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
      </div>

      <div class="d-flex justify-content-between align-items-center mb-3">

        <a href="getOtp" class="small text-decoration-none">Forgot password?</a>
      </div>

      <div id="error" class="text-danger small mb-2" style="display:none"></div>

      <div class="d-grid gap-2">
        <button class="btn btn-primary" type="submit">Sign in</button>
      </div>
    </form>
  </div>
   <footer>
    <span id="dateTime" class="date-time"></span>
    <p>&copy; 2025 ecomerce portal | e-portal</p>
</footer>

<script>

    function updateDateTime() {
        document.getElementById("dateTime").textContent = new Date().toLocaleString();
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
</script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
