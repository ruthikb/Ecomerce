<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
    <title>Vendor Management System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>

        :root{
            --primary:#0f172a;
            --secondary:#1e293b;
            --accent:#3b82f6;
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

        /* HEADER */

        header{
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:75px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:0 50px;
            background: rgba(0,0,0,0.35);
            backdrop-filter: blur(12px);
            border-bottom:1px solid rgba(255,255,255,0.1);
            z-index:1000;
        }

        .logo{
            font-size:28px;
            font-weight:700;
            letter-spacing:1px;
            color:white;
        }

        nav a{
            text-decoration:none;
            color:white;
            margin-left:30px;
            font-size:17px;
            font-weight:500;
            transition:0.3s;
            position:relative;
        }

        nav a::after{
            content:'';
            position:absolute;
            left:0;
            bottom:-5px;
            width:0%;
            height:2px;
            background:#60a5fa;
            transition:0.3s;
        }

        nav a:hover::after{
            width:100%;
        }

        nav a:hover{
            color:#93c5fd;
        }

        /* MAIN */

        main{
            padding:120px 40px 100px;
        }

        /* HERO SECTION */

        .hero{
            display:flex;
            justify-content:space-between;
            align-items:center;
            flex-wrap:wrap;
            gap:40px;
            padding:60px;
            border-radius:30px;
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(15px);
            box-shadow:0 8px 32px rgba(0,0,0,0.3);
            animation:fadeIn 1s ease;
        }

        .hero-content{
            flex:1;
            min-width:300px;
        }

        .hero-content h1{
            font-size:55px;
            line-height:1.2;
            margin-bottom:20px;
        }

        .hero-content span{
            color:#93c5fd;
        }

        .hero-content p{
            font-size:18px;
            color:#dbeafe;
            line-height:1.8;
            margin-bottom:30px;
        }

        .hero-image{
            flex:1;
            text-align:center;
            min-width:300px;
        }

        .hero-image img{
            width:100%;
            max-width:500px;
            border-radius:25px;
            animation:float 3s ease-in-out infinite;
        }

        /* BUTTONS */

        .btn{
            padding:15px 35px;
            border:none;
            border-radius:50px;
            background: linear-gradient(45deg,#2563eb,#60a5fa);
            color:white;
            font-size:18px;
            font-weight:600;
            cursor:pointer;
            transition:0.4s;
            text-decoration:none;
            display:inline-block;
            box-shadow:0 5px 20px rgba(59,130,246,0.5);
        }

        .btn:hover{
            transform:translateY(-5px) scale(1.05);
            box-shadow:0 10px 25px rgba(96,165,250,0.7);
        }

        /* SECTION TITLE */

        .section-title{
            text-align:center;
            font-size:40px;
            margin:70px 0 40px;
            font-weight:700;
        }

        /* CARD SECTION */

        .laptop-section{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
            gap:30px;
        }

        .card{
            background: rgba(255,255,255,0.12);
            border-radius:20px;
            overflow:hidden;
            backdrop-filter: blur(12px);
            box-shadow:0 8px 25px rgba(0,0,0,0.25);
            transition:0.4s;
            padding:20px;
            text-align:center;
            border:1px solid rgba(255,255,255,0.1);
        }

        .card:hover{
            transform:translateY(-12px) scale(1.03);
            box-shadow:0 12px 30px rgba(0,0,0,0.35);
        }

        .card img{
            width:100%;
            height:230px;
            object-fit:cover;
            border-radius:15px;
            transition:0.4s;
        }

        .card:hover img{
            transform:scale(1.05);
        }

        .card h3{
            margin-top:20px;
            font-size:24px;
            color:white;
        }

        .card p{
            margin-top:10px;
            color:#dbeafe;
            font-size:15px;
            line-height:1.6;
        }

        .price{
            margin-top:15px;
            font-size:22px;
            color:#93c5fd;
            font-weight:700;
        }

        /* FEATURES */

        .features{
            margin-top:70px;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px;
        }

        .feature-box{
            padding:30px;
            text-align:center;
            background: rgba(255,255,255,0.1);
            border-radius:20px;
            backdrop-filter: blur(10px);
            transition:0.3s;
        }

        .feature-box:hover{
            transform:translateY(-8px);
        }

        .feature-box h3{
            margin-bottom:15px;
            color:#93c5fd;
        }

        /* FOOTER */

        footer{
            margin-top:80px;
            background: rgba(0,0,0,0.35);
            backdrop-filter: blur(10px);
            padding:20px;
            text-align:center;
            position:relative;
            border-top:1px solid rgba(255,255,255,0.1);
        }

        .date-time{
            position:absolute;
            right:20px;
            top:20px;
            color:#93c5fd;
            font-weight:600;
        }

        /* ANIMATIONS */

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

        @keyframes float{
            0%{
                transform:translateY(0px);
            }
            50%{
                transform:translateY(-15px);
            }
            100%{
                transform:translateY(0px);
            }
        }

        /* RESPONSIVE */

        @media(max-width:768px){

            header{
                padding:0 20px;
            }

            .logo{
                font-size:20px;
            }

            nav a{
                margin-left:15px;
                font-size:14px;
            }

            .hero{
                padding:40px 25px;
            }

            .hero-content h1{
                font-size:38px;
            }

            .hero-content p{
                font-size:16px;
            }

            .section-title{
                font-size:32px;
            }

            .btn{
                padding:12px 28px;
                font-size:16px;
            }
        }

    </style>
</head>

<body>

<!-- HEADER -->

<header>

    <div class="logo">Vendor Management</div>

    <nav>

        <a href="loginUser">Login</a>
    </nav>

</header>

<!-- MAIN -->

<main>

    <!-- HERO SECTION -->

    <section class="hero">

        <div class="hero-content">

            <h1>
                Smart <span>Vendor</span><br>
                Management System
            </h1>

            <p>
                Manage laptop procurement, inventory, suppliers,
                and retailer operations with a modern digital platform.
                Fast, secure, and efficient vendor management solution.
            </p>

            <a href="loginUser" class="btn">
                Explore Now
            </a>

        </div>

        <div class="hero-image">

            <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=1200&auto=format&fit=crop"
                 alt="Laptop">

        </div>

    </section>

    <!-- PRODUCTS -->

    <h2 class="section-title">Popular Laptops</h2>

    <section class="laptop-section">

        <div class="card">

            <img src="https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTUcO5AVZw4TJdQCU9nSTsTJ78FYsjzUk8r_FV5qE_pzoN5PaUOO4f49kSuUWQoHJb_Y1jD-blkm9pp_7qLE2i2GfepyAj1oMTtpDwpLWru_c-HM_PmCL_9zw">

            <h3>MacBook Pro</h3>

            <p>
                High-performance laptop designed for developers,
                designers, and professionals.
            </p>

            <div class="price">₹1,45,000</div>

        </div>

        <div class="card">

            <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?q=80&w=1200&auto=format&fit=crop">

            <h3>Samsung Notebook</h3>

            <p>
                Lightweight and stylish notebook with powerful
                multitasking performance.
            </p>

            <div class="price">₹85,000</div>

        </div>

        <div class="card">

            <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?q=80&w=1200&auto=format&fit=crop">

            <h3>MacBook Air</h3>

            <p>
                Ultra-thin laptop with long battery life
                and premium display quality.
            </p>

            <div class="price">₹1,10,000</div>

        </div>

    </section>

    <!-- FEATURES -->

    <h2 class="section-title">Why Choose Us?</h2>

    <section class="features">

        <div class="feature-box">
            <h3>Secure Platform</h3>
            <p>
                Advanced authentication and secure vendor operations.
            </p>
        </div>

        <div class="feature-box">
            <h3>Fast Delivery</h3>
            <p>
                Efficient procurement and retailer distribution process.
            </p>
        </div>

        <div class="feature-box">
            <h3>Modern Dashboard</h3>
            <p>
                Beautiful UI with easy product and inventory management.
            </p>
        </div>

        <div class="feature-box">
            <h3>24/7 Support</h3>
            <p>
                Dedicated customer and vendor support services.
            </p>
        </div>

    </section>

</main>

<!-- FOOTER -->

<footer>

    <span id="dateTime" class="date-time"></span>

    <p>
        © 2026 Vendor Management System | All Rights Reserved
    </p>

</footer>

<!-- SCRIPT -->

<script>

    function updateDateTime() {

        document.getElementById("dateTime").textContent =
            new Date().toLocaleString();

    }

    setInterval(updateDateTime,1000);

    updateDateTime();

</script>

</body>
</html>