<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Integer userCount=(Integer)request.getAttribute("userCount");
Integer restaurantCount=(Integer)request.getAttribute("restaurantCount");
Integer menuCount=(Integer)request.getAttribute("menuCount");
Integer orderCount=(Integer)request.getAttribute("orderCount");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{

margin:0;

padding:0;

box-sizing:border-box;

font-family:'Poppins',sans-serif;

}

body{

background:#f5f6fa;

}

/* NAVBAR */

.navbar{

background:#E23744;

padding:15px 50px;

}

.navbar-brand{

color:white!important;

font-size:30px;

font-weight:700;

}

.nav-link{

color:white!important;

font-size:17px;

margin-left:20px;

}

/* HEADER */

.header{

padding:40px;

background:white;

box-shadow:0 3px 10px rgba(0,0,0,.08);

margin-bottom:30px;

}

.header h2{

font-weight:700;

color:#E23744;

}

/* DASHBOARD CARD */

.dashboard-card{

background:white;

padding:30px;

border-radius:18px;

box-shadow:0 8px 20px rgba(0,0,0,.08);

transition:.3s;

text-align:center;

}

.dashboard-card:hover{

transform:translateY(-8px);

}

.dashboard-card i{

font-size:45px;

margin-bottom:15px;

color:#E23744;

}

.dashboard-card h3{

font-size:34px;

font-weight:700;

}

.dashboard-card p{

font-size:18px;

color:#666;

}
/* MANAGEMENT CARD */

.manage-card{

background:white;

padding:30px;

border-radius:18px;

box-shadow:0 8px 20px rgba(0,0,0,.08);

text-align:center;

transition:.3s;

height:100%;

}

.manage-card:hover{

transform:translateY(-8px);

box-shadow:0 12px 25px rgba(0,0,0,.15);

}

.manage-card i{

font-size:50px;

color:#E23744;

margin-bottom:15px;

}

.manage-card h4{

font-weight:700;

margin-bottom:10px;

}

.manage-card p{

color:#666;

margin-bottom:20px;

}

.manage-card a{

text-decoration:none;

}

.btn-manage{

background:#E23744;

color:white;

border:none;

padding:10px 25px;

border-radius:30px;

font-weight:600;

transition:.3s;

}

.btn-manage:hover{

background:#c71c31;

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand" href="#">

🍽 FoodieHub Admin

</a>

<div class="ms-auto">

<a class="nav-link d-inline" href="adminDashboard">

Dashboard

</a>

<a class="nav-link d-inline" href="logout">

Logout

</a>

</div>

</div>

</nav>

<!-- ================= HEADER ================= -->

<div class="header">

<div class="container">

<h2>

👋 Welcome, Admin

</h2>

<p class="text-muted">

Manage your FoodieHub application from one place.

</p>

</div>

</div>

<div class="container">

<div class="row g-4">

<div class="col-lg-3 col-md-6">

<div class="dashboard-card">

<i class="fa-solid fa-users"></i>

<h3>

<%=userCount%>

</h3>

<p>

Total Users

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="dashboard-card">

<i class="fa-solid fa-store"></i>

<h3>

<%=restaurantCount%>

</h3>

<p>

Restaurants

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="dashboard-card">

<i class="fa-solid fa-bowl-food"></i>

<h3>

<%=menuCount%>

</h3>

<p>

Menu Items

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="dashboard-card">

<i class="fa-solid fa-box"></i>

<h3>

<%=orderCount%>

</h3>

<p>

Orders

</p>

</div>

</div>

</div>

<br><br>

<h3 class="mb-4">

⚙ Management

</h3>

<div class="row g-4">
<div class="col-lg-3 col-md-6">

<div class="manage-card">

<i class="fa-solid fa-store"></i>

<h4>

Manage Restaurants

</h4>

<p>

Add, update and delete restaurants.

</p>

<a href="adminRestaurants">

<button class="btn-manage">

Manage

</button>

</a>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="manage-card">

<i class="fa-solid fa-utensils"></i>

<h4>

Manage Menu

</h4>

<p>

Add, update and delete menu items.

</p>

<a href="adminMenu">

<button class="btn-manage">

Manage

</button>

</a>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="manage-card">

<i class="fa-solid fa-box"></i>

<h4>

Manage Orders

</h4>

<p>

View and update customer orders.

</p>

<a href="adminOrders">

<button class="btn-manage">

Manage

</button>

</a>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="manage-card">

<i class="fa-solid fa-users"></i>

<h4>

Manage Users

</h4>

<p>

View registered users and their details.

</p>

<a href="adminUsers">

<button class="btn-manage">

Manage

</button>

</a>

</div>

</div>

</div>

</div>
<!-- ================= FOOTER ================= -->

<footer
style="margin-top:60px;
background:#222;
color:white;
padding:40px 0;">

<div class="container">

<div class="row">

<div class="col-md-4">

<h4 style="color:#E23744;">

🍽 FoodieHub Admin

</h4>

<p>

Manage restaurants, menus, orders and users efficiently.

</p>

</div>

<div class="col-md-4">

<h5>

Quick Links

</h5>

<p>

<a href="adminDashboard"
style="color:white;text-decoration:none;">

Dashboard

</a>

</p>

<p>

<a href="adminRestaurants"
style="color:white;text-decoration:none;">

Restaurants

</a>

</p>

<p>

<a href="adminMenu"
style="color:white;text-decoration:none;">

Menu

</a>

</p>

<p>

<a href="adminOrders"
style="color:white;text-decoration:none;">

Orders

</a>

</p>

</div>

<div class="col-md-4">

<h5>

FoodieHub

</h5>

<p>

Admin Control Panel

</p>

<p>

Version 1.0

</p>

</div>

</div>

<hr>

<div class="text-center">

<p>

© 2026 FoodieHub Admin Panel. All Rights Reserved.

</p>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>