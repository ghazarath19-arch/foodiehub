<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.foodiehub.model.Cart"%>
<%@ page import="com.foodiehub.model.CartItem"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

Collection<CartItem> cartItems=null;

double total=0;

if(cart!=null){

cartItems=cart.getItems();

total=cart.getTotalPrice();

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Cart</title>

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

background:#f8f8f8;

}

/* ================= NAVBAR ================= */

.navbar{

background:white;

padding:15px 60px;

box-shadow:0 4px 15px rgba(0,0,0,.08);

position:sticky;

top:0;

z-index:1000;

}

.navbar-brand{

font-size:34px;

font-weight:700;

color:#E23744 !important;

}

.nav-link{

font-size:18px;

font-weight:500;

margin-left:25px;

color:#444 !important;

}

.nav-link:hover{

color:#E23744 !important;

}

/* ================= HEADER ================= */

.cart-header{

padding:50px 0;

text-align:center;

background:linear-gradient(135deg,#E23744,#ff6b6b);

color:white;

}

.cart-header h1{

font-size:50px;

font-weight:700;

}

.cart-header p{

font-size:20px;

margin-top:10px;

}

/* ================= CART TABLE ================= */

.cart-box{

margin-top:40px;

background:white;

border-radius:18px;

padding:25px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

}

.table{

vertical-align:middle;

}

.table img{

width:110px;

height:90px;

border-radius:12px;

object-fit:cover;

}

.food-name{

font-size:20px;

font-weight:600;

}

.price{

font-size:18px;

font-weight:600;

color:#E23744;

}

.qty-btn{

width:35px;

height:35px;

border:none;

border-radius:50%;

background:#E23744;

color:white;

font-weight:bold;

}

.qty{

font-size:18px;

font-weight:600;

padding:0 10px;

}

.remove-btn{

background:#dc3545;

color:white;

border:none;

padding:8px 16px;

border-radius:8px;

}

.remove-btn:hover{

background:#bb2d3b;

}

.summary{

background:white;

padding:25px;

border-radius:18px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

margin-top:30px;

}

.summary h3{

color:#E23744;

margin-bottom:20px;

}

.checkout-btn{

width:100%;

padding:14px;

background:#E23744;

color:white;

border:none;

border-radius:30px;

font-size:18px;

font-weight:600;

transition:.3s;

}

.checkout-btn:hover{

background:#c71c31;

}

.empty-cart{

text-align:center;

padding:80px 20px;

}

.empty-cart i{

font-size:90px;

color:#E23744;

margin-bottom:20px;

}

footer{

margin-top:60px;

background:#222;

color:white;

padding:40px;

text-align:center;

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

<a class="nav-link" href="menu">

Menu

</a>

</li>

<li class="nav-item">

<a class="nav-link active" href="cart">

Cart

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

<div class="cart-header">

<h1>

🛒 Shopping Cart

</h1>

<p>

Review your delicious order before checkout

</p>

</div>

<div class="container">

<%

if(cart!=null && !cart.isEmpty()){

%>

<div class="cart-box">

<table class="table table-hover align-middle">

<thead>

<tr>

<th>Food</th>

<th>Name</th>

<th>Price</th>

<th>Quantity</th>

<th>Total</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

for(CartItem item : cartItems){

%>

<tr>

<td>

<img src="<%=item.getImageUrl()%>">

</td>

<td>

<div class="food-name">

<%=item.getItemName()%>

</div>

</td>

<td>

<span class="price">

₹ <%=item.getPrice()%>

</span>

</td>

<td>

<a href="cart?action=update&menuId=<%=item.getMenuId()%>&quantity=<%=item.getQuantity()-1%>">

<button class="qty-btn">

-

</button>

</a>

<span class="qty">

<%=item.getQuantity()%>

</span>

<a href="cart?action=update&menuId=<%=item.getMenuId()%>&quantity=<%=item.getQuantity()+1%>">

<button class="qty-btn">

+

</button>

</a>

</td>

<td>

<b>

₹ <%=item.getTotalPrice()%>

</b>

</td>

<td>

<a href="cart?action=remove&menuId=<%=item.getMenuId()%>">

<button class="remove-btn">

Remove

</button>

</a>

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>
<div class="row mt-4">

<div class="col-lg-8">

</div>

<div class="col-lg-4">

<div class="summary">

<h3>

Order Summary

</h3>

<hr>

<%

double deliveryCharge = 40;

double gst = total * 0.05;

double grandTotal = total + deliveryCharge + gst;

%>

<div class="d-flex justify-content-between mb-3">

<span>

Subtotal

</span>

<b>

₹ <%=String.format("%.2f", total)%>

</b>

</div>

<div class="d-flex justify-content-between mb-3">

<span>

Delivery Charge

</span>

<b>

₹ <%=String.format("%.2f", deliveryCharge)%>

</b>

</div>

<div class="d-flex justify-content-between mb-3">

<span>

GST (5%)

</span>

<b>

₹ <%=String.format("%.2f", gst)%>

</b>

</div>

<hr>

<div class="d-flex justify-content-between mb-4">

<h5>

Grand Total

</h5>

<h4 style="color:#E23744;">

₹ <%=String.format("%.2f", grandTotal)%>

</h4>

</div>

<a href="checkout">

<button class="checkout-btn">

<i class="fa-solid fa-credit-card"></i>

Proceed to Checkout

</button>

</a>

<div class="mt-4">

<p>

<i class="fa-solid fa-shield-halved text-success"></i>

Secure Payment

</p>

<p>

<i class="fa-solid fa-truck-fast text-primary"></i>

Fast Delivery

</p>

<p>

<i class="fa-solid fa-circle-check text-success"></i>

Fresh & Hygienic Food

</p>

</div>

</div>

</div>

</div>

<%
}
else{
%>

<div class="empty-cart">

<i class="fa-solid fa-cart-shopping"></i>

<h2>

Your Cart is Empty

</h2>

<p class="text-muted">

Looks like you haven't added any delicious food yet.

</p>

<br>

<a href="restaurants">

<button class="checkout-btn"
style="width:250px;">

Browse Restaurants

</button>

</a>

</div>

<%
}
%>
<!-- ================= FOOTER ================= -->

<footer>

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

<a href="#"
style="color:white;text-decoration:none;">

Orders

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

Contact

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

<p>

© 2026 FoodieHub. All Rights Reserved.

</p>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>