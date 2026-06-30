<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodiehub.model.Order"%>

<%
List<Order> orderList=(List<Order>)request.getAttribute("orderList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Order History</title>

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

background:#f5f5f5;

}

/* NAVBAR */

.navbar{

background:white;

padding:15px 60px;

box-shadow:0 3px 12px rgba(0,0,0,.08);

}

.navbar-brand{

font-size:34px;

font-weight:700;

color:#E23744 !important;

}

.nav-link{

font-size:17px;

font-weight:500;

margin-left:20px;

color:#444 !important;

}

.nav-link:hover{

color:#E23744 !important;

}

/* HEADER */

.header{

background:linear-gradient(135deg,#E23744,#ff6b6b);

padding:50px;

text-align:center;

color:white;

}

.header h1{

font-size:48px;

font-weight:700;

}

.header p{

font-size:18px;

margin-top:10px;

}

/* ORDER CARD */

.order-card{

background:white;

padding:25px;

margin-top:25px;

border-radius:18px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

}

.status{

padding:6px 14px;

border-radius:20px;

font-weight:600;

background:#28a745;

color:white;

}

.amount{

font-size:24px;

font-weight:700;

color:#E23744;

}

</style>

</head>

<body>
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand" href="restaurants">

🍽 FoodieHub

</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse justify-content-end"
id="navbarNav">

<ul class="navbar-nav">

<li class="nav-item">

<a class="nav-link" href="restaurants">

Restaurants

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="cart">

Cart

</a>

</li>

<li class="nav-item">

<a class="nav-link active" href="orderHistory">

My Orders

</a>

</li>

<li class="nav-item">

<a class="nav-link" href="logout">

Logout

</a>

</li>

</ul>

</div>

</div>

</nav>

<!-- ================= HEADER ================= -->

<div class="header">

<h1>

📦 My Orders

</h1>

<p>

Track all your FoodieHub orders in one place

</p>

</div>

<div class="container mb-5">

<%

if(orderList!=null && !orderList.isEmpty()){

for(Order order : orderList){

%>

<div class="order-card">

<div class="row">

<div class="col-md-8">

<h4>

Order #<%=order.getOrderId()%>

</h4>

<br>

<p>

<b>Restaurant ID :</b>

<%=order.getRestaurantId()%>

</p>

<p>

<b>Payment :</b>

<%=order.getPaymentMode()%>

</p>

<p>

<b>Delivery Address :</b>

<%=order.getDeliveryAddress()%>

</p>

<p>

<b>Order Date :</b>

<%=order.getOrderDate()%>

</p>

</div>

<div class="col-md-4 text-end">

<div class="amount">

₹ <%=String.format("%.2f",order.getTotalAmount())%>

</div>

<br>

<span class="status">

<%=order.getStatus()%>

</span>

</div>

</div>

</div>

<%

}

}
else{

%>
<div class="text-center mt-5">

<i class="fa-solid fa-box-open"
style="font-size:90px;color:#E23744;"></i>

<h2 class="mt-4">

No Orders Found

</h2>

<p class="text-muted">

You haven't placed any orders yet.

</p>

<a href="restaurants">

<button class="btn btn-danger mt-3 px-4 py-2">

🍽 Continue Shopping

</button>

</a>

</div>

<%

}

%>

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

🍽 FoodieHub

</h4>

<p>

Fresh Food • Fast Delivery • Happy Customers

</p>

</div>

<div class="col-md-4">

<h5>

Quick Links

</h5>

<p>

<a href="restaurants"
style="color:white;text-decoration:none;">

Restaurants

</a>

</p>

<p>

<a href="cart"
style="color:white;text-decoration:none;">

Cart

</a>

</p>

<p>

<a href="orderHistory"
style="color:white;text-decoration:none;">

My Orders

</a>

</p>

<p>

<a href="logout"
style="color:white;text-decoration:none;">

Logout

</a>

</p>

</div>

<div class="col-md-4">

<h5>

Contact Us

</h5>

<p>

📍 Nellore, Andhra Pradesh

</p>

<p>

📞 +91 9876543210

</p>

<p>

📧 support@foodiehub.com

</p>

</div>

</div>

<hr>

<div class="text-center">

<p>

© 2026 FoodieHub. All Rights Reserved.

</p>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>