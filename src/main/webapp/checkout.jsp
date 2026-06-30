<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.foodiehub.model.Cart"%>
<%@ page import="com.foodiehub.model.CartItem"%>
<%@ page import="java.util.Collection"%>

<%
Cart cart=(Cart)session.getAttribute("cart");

if(cart==null || cart.isEmpty()){

response.sendRedirect("cart");

return;

}

Collection<CartItem> cartItems=cart.getItems();

double subtotal=cart.getTotalPrice();

double deliveryCharge=40;

double gst=subtotal*0.05;

double grandTotal=subtotal+deliveryCharge+gst;
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Checkout</title>

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

background:#fff;

padding:15px 60px;

box-shadow:0 3px 12px rgba(0,0,0,.08);

position:sticky;

top:0;

z-index:1000;

}

.navbar-brand{

font-size:32px;

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

/* ================= HEADER ================= */

.checkout-header{

background:linear-gradient(135deg,#E23744,#ff6b6b);

color:white;

padding:45px;

text-align:center;

}

.checkout-header h1{

font-size:46px;

font-weight:700;

}

.checkout-header p{

font-size:18px;

margin-top:10px;

}

/* ================= CARDS ================= */

.checkout-card{

background:white;

padding:25px;

border-radius:18px;

margin-top:30px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

}

.checkout-card h3{

margin-bottom:20px;

color:#E23744;

font-weight:700;

}

.form-control{

height:50px;

border-radius:12px;

}

textarea.form-control{

height:120px;

resize:none;

}
/* ================= ORDER SUMMARY ================= */

.summary-card{

background:white;

padding:25px;

border-radius:18px;

margin-top:30px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

position:sticky;

top:100px;

}

.summary-card h3{

color:#E23744;

margin-bottom:20px;

font-weight:700;

}

.order-item{

display:flex;

justify-content:space-between;

margin-bottom:15px;

padding-bottom:10px;

border-bottom:1px solid #eee;

}

.total{

font-size:24px;

font-weight:700;

color:#E23744;

}

.place-btn{

width:100%;

padding:14px;

background:#E23744;

color:white;

border:none;

border-radius:30px;

font-size:18px;

font-weight:600;

margin-top:20px;

transition:.3s;

}

.place-btn:hover{

background:#c71c31;

}

@media(max-width:768px){

.navbar{

padding:15px 20px;

}

.checkout-header h1{

font-size:34px;

}

.summary-card{

position:relative;

top:0;

}

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

<div>

<a href="restaurants" class="nav-link d-inline">

Restaurants

</a>

<a href="cart" class="nav-link d-inline">

Cart

</a>

<a href="logout" class="nav-link d-inline">

Logout

</a>

</div>

</div>

</nav>

<!-- ================= HEADER ================= -->

<div class="checkout-header">

<h1>

Checkout

</h1>

<p>

Almost there! Complete your order.

</p>

</div>

<div class="container">

<form action="checkout" method="post">

<div class="row">

<div class="col-lg-8">

<div class="checkout-card">

<h3>

📍 Delivery Address

</h3>

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">

Full Name

</label>

<input
type="text"
name="customerName"
class="form-control"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Mobile Number

</label>

<input
type="text"
name="mobile"
class="form-control"
required>

</div>

<div class="col-12 mb-3">

<label class="form-label">

Delivery Address

</label>

<textarea
name="address"
class="form-control"
required></textarea>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

City

</label>

<input
type="text"
name="city"
class="form-control"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Pincode

</label>

<input
type="text"
name="pincode"
class="form-control"
required>

</div>

<div class="col-12">

<label class="form-label">

Landmark (Optional)

</label>

<input
type="text"
name="landmark"
class="form-control">

</div>

</div>

</div>
</div>

<!-- ================= ORDER SUMMARY ================= -->

<div class="col-lg-4">

<div class="summary-card">

<h3>

🛒 Order Summary

</h3>

<%

for(CartItem item : cartItems){

%>

<div class="order-item">

<div>

<b>

<%=item.getItemName()%>

</b>

<br>

<small>

Qty : <%=item.getQuantity()%>

</small>

</div>

<div>

₹ <%=String.format("%.2f",item.getTotalPrice())%>

</div>

</div>

<%

}

%>

<hr>

<div class="d-flex justify-content-between mb-2">

<span>

Subtotal

</span>

<b>

₹ <%=String.format("%.2f",subtotal)%>

</b>

</div>

<div class="d-flex justify-content-between mb-2">

<span>

Delivery Charges

</span>

<b>

₹ <%=String.format("%.2f",deliveryCharge)%>

</b>

</div>

<div class="d-flex justify-content-between mb-2">

<span>

GST (5%)

</span>

<b>

₹ <%=String.format("%.2f",gst)%>

</b>

</div>

<hr>

<div class="d-flex justify-content-between">

<span class="total">

Grand Total

</span>

<span class="total">

₹ <%=String.format("%.2f",grandTotal)%>

</span>

</div>

<br>

<h5>

💳 Payment Method

</h5>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="paymentMode"
value="Cash on Delivery"
checked>

<label class="form-check-label">

Cash on Delivery

</label>

</div>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="paymentMode"
value="UPI">

<label class="form-check-label">

UPI

</label>

</div>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="paymentMode"
value="Credit/Debit Card">

<label class="form-check-label">

Credit / Debit Card

</label>

</div>

<button
type="submit"
class="place-btn">

🚀 Place Order

</button>

</div>

</div>

</div>

</form>
<!-- ================= FOOTER ================= -->

<footer style="margin-top:60px;
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

<a href="menu"
style="color:white;text-decoration:none;">

Menu

</a>

</p>

<p>

<a href="cart"
style="color:white;text-decoration:none;">

Cart

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

Need Help?

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

<script>

document.querySelector("form").addEventListener("submit",function(e){

let confirmOrder=confirm("Do you want to place this order?");

if(!confirmOrder){

e.preventDefault();

}

});

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
