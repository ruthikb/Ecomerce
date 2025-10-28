<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
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
            font-size: 0.9em;
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
</head>
<body>

<header>
    <h1>ecomerce Portal</h1>
    <nav>
        <a href="loginUser">Login</a>
    </nav>
</header>

<main>
    <section class="hero">
        <h2>Welcome to e-Portal</h2>
        <p>Manage your laptop procurement efficiently</p>
        <button class="btn" onclick="window.location.href='index'">Explore Now</button>
    </section>

    <section class="laptop-section">
        <div class="card">
            <img src="data:image/webp;base64,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" alt="Laptop Model 1">
            <h4>samsung notebook</h4>
            <p>Powerful performance and modern design for showrooms</p>
        </div>
        <div class="card">
            <img src="https://i.pcmag.com/imagery/reviews/0227QDT3xYwn3xEOpyiJpNU-1.fit_scale.size_760x427.v1574212824.jpg">
            <h4>mac book pro</h4>
            <p>Business-class reliability and robust build quality</p>
        </div>
        <div class="card">
            <img src="https://th.bing.com/th/id/OPAC.drt56BAdIGBkjA474C474?w=220&h=220&c=17&o=5&cb=12&dpr=1.3&pid=21.1">
            <h4>mac boox air</h4>
            <p>Lightweight, fast, and stylish — perfect for display units</p>
        </div>
    </section>
</main>

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

</body>
</html>
