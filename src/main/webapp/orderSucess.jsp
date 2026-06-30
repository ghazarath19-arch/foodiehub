<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Order Success | FoodieHub</title>

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

display:flex;

justify-content:center;

align-items:center;

height:100vh;

}

.success-card{

background:white;

padding:50px;

border-radius:20px;

text-align:center;

box-shadow:0 10px 30px rgba(0,0,0,.15);

width:600px;

}

.success-icon{

font-size:90px;

color:#28a745;

margin-bottom:20px;

}

h1{

color:#28a745;

font-weight:700;

margin-bottom:15px;

}

.message{

font-size:18px;

color:#666;

margin-bottom:20px;

}

.delivery{

background:#f8f8f8;

padding:15px;

border-radius:12px;

margin-bottom:30px;

font-size:18px;

font-weight:600;

}

.btn-custom{

width:100%;

padding:14px;

margin-top:15px;

font-size:18px;

font-weight:600;

border-radius:30px;

}

</style>

</head>

<body>

<div class="success-card">

<div class="success-icon">

<i class="fa-solid fa-circle-check"></i>

</div>

<h1>

Order Placed Successfully!

</h1>

<p class="message">

Thank you for ordering with <b>FoodieHub</b>.

Your delicious food is being prepared.

</p>

<div class="delivery">

🚚 Estimated Delivery Time

<br><br>

<b>30 - 40 Minutes</b>

</div>

<a href="restaurants">

<button class="btn btn-danger btn-custom">

🍽 Continue Shopping

</button>

</a>

<a href="orderHistory">

<button class="btn btn-success btn-custom">

📦 View My Orders

</button>

</a>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>