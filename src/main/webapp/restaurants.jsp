<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.foodiehub.model.Restaurant"%>

<%
List<Restaurant> restaurantList =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Restaurants</title>

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
background:#f7f7f7;
}

/* ================= NAVBAR ================= */

.navbar{

background:white;

padding:15px 60px;

box-shadow:0 3px 12px rgba(0,0,0,.08);

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

transition:.3s;

}

.nav-link:hover{

color:#E23744 !important;

}

/* ================= HERO ================= */

.hero{

min-height:260px;

background:
linear-gradient(rgba(0,0,0,.60),
rgba(0,0,0,.60)),
url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=80");

background-size:cover;

background-position:center;

display:flex;

flex-direction:column;

justify-content:center;

align-items:center;

text-align:center;

color:white;

}

.hero h1{

font-size:62px;

font-weight:700;

}

.hero p{

font-size:22px;

margin-top:12px;

}

/* ================= SEARCH ================= */

.search-box{

margin-top:30px;

width:70%;

max-width:760px;

position:relative;

}

.search-box input{

width:100%;

padding:16px 20px 16px 58px;

border:none;

outline:none;

border-radius:50px;

font-size:18px;

box-shadow:0 10px 25px rgba(0,0,0,.25);

}

.search-box i{

position:absolute;

left:22px;

top:18px;

font-size:20px;

color:#E23744;

}

/* ================= CATEGORIES ================= */

.categories{

margin-top:30px;

}

.categories .btn{

margin:6px;

padding:10px 24px;

border-radius:30px;

font-weight:600;

background:white;

color:#E23744;

border:none;

transition:.3s;

}

.categories .btn:hover{

background:#E23744;

color:white;

transform:translateY(-4px);

}

/* ================= SECTION TITLE ================= */

.heading{

margin:45px 0;

text-align:center;

font-size:42px;

font-weight:700;

color:#E23744;

}
/* ================= RESTAURANT CARD ================= */

.restaurant-card{

background:white;

border-radius:20px;

overflow:hidden;

box-shadow:0 8px 20px rgba(0,0,0,.10);

transition:.35s;

cursor:pointer;

height:100%;

position:relative;

}

.restaurant-card:hover{

transform:translateY(-10px);

box-shadow:0 18px 35px rgba(0,0,0,.18);

}

.restaurant-card img{

width:100%;

height:220px;

object-fit:cover;

}

.card-body{

padding:18px;

}

.restaurant-name{

font-size:24px;

font-weight:700;

color:#222;

margin-bottom:8px;

}

.rating{

position:absolute;

right:15px;

top:235px;

background:#24963F;

color:white;

padding:5px 12px;

border-radius:20px;

font-weight:600;

font-size:15px;

}

.open{

display:inline-block;

background:#28a745;

color:white;

padding:4px 12px;

border-radius:20px;

font-size:13px;

font-weight:600;

margin-bottom:12px;

}

.info{

margin:10px 0;

font-size:16px;

color:#555;

}

.info i{

width:25px;

color:#E23744;

}

.cost{

font-size:18px;

font-weight:600;

margin-top:10px;

color:#111;

}

.desc{

margin-top:10px;

font-size:14px;

color:#777;

height:42px;

overflow:hidden;

}

.btn-menu{

width:100%;

margin-top:18px;

padding:12px;

border:none;

border-radius:30px;

background:#E23744;

color:white;

font-size:17px;

font-weight:600;

transition:.3s;

}

.btn-menu:hover{

background:#c71c31;

transform:scale(1.02);

}

.favorite{

position:absolute;

top:15px;

right:15px;

width:42px;

height:42px;

background:white;

border-radius:50%;

display:flex;

align-items:center;

justify-content:center;

box-shadow:0 3px 10px rgba(0,0,0,.2);

font-size:20px;

color:#E23744;

}

.favorite:hover{

background:#E23744;

color:white;

}

/* ================= FOOTER ================= */

footer{

margin-top:70px;

background:#222;

color:white;

padding:45px;

text-align:center;

}

footer h4{

margin-bottom:15px;

}

footer p{

margin:5px 0;

color:#ddd;

}

/* ================= RESPONSIVE ================= */

@media(max-width:768px){

.hero h1{

font-size:40px;

}

.hero p{

font-size:18px;

}

.search-box{

width:90%;

}

.heading{

font-size:30px;

}

.navbar{

padding:15px 20px;

}

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand" href="#">
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
<a class="nav-link" href="home.jsp">Home</a>
</li>

<li class="nav-item">
<a class="nav-link active" href="restaurants">Restaurants</a>
</li>

<li class="nav-item">
<a class="nav-link" href="#">Orders</a>
</li>

<li class="nav-item">
<a class="nav-link" href="logout">Logout</a>
</li>

</ul>

</div>

</div>

</nav>

<!-- ================= HERO ================= -->

<div class="hero">

<h1>Discover the Best Food Near You</h1>

<p>Order food from your favourite restaurants</p>

<div class="search-box">

<i class="fa-solid fa-magnifying-glass"></i>

<input
type="text"
id="searchInput"
placeholder="Search restaurants or cuisines..."
onkeyup="searchRestaurant()">

</div>

<div class="categories">

<button class="btn">🍕 Pizza</button>

<button class="btn">🍔 Burger</button>

<button class="btn">🍗 Chicken</button>

<button class="btn">🥘 Biryani</button>

<button class="btn">🍜 Chinese</button>

<button class="btn">🥗 Healthy</button>

</div>

</div>

<div class="container">

<h2 class="heading">

🔥 Popular Restaurants

</h2>

<div class="row g-4" id="restaurantContainer">
<%
if(restaurantList != null){

for(Restaurant restaurant : restaurantList){

String image="";

switch(restaurant.getRestaurantName()){

case "Paradise Biryani":
image="https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=900&q=80";
break;

case "KFC":
image="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=900&q=80";
break;

case "Dominos":
image="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=80";
break;

case "Burger King":
image="https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=900&q=80";
break;

case "Mehfil":
image="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=80";
break;

default:
image="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=900&q=80";

}
%>

<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12 restaurant-item">

<div class="restaurant-card">

<div class="favorite">

<i class="fa-regular fa-heart"></i>

</div>

<img src="<%=image%>"
alt="<%=restaurant.getRestaurantName()%>">

<div class="card-body">

<span class="open">

🟢 Open Now

</span>

<h4 class="restaurant-name">

<%=restaurant.getRestaurantName()%>

<span class="rating">

⭐ <%=restaurant.getRating()%>

</span>

</h4>

<div class="info">

<i class="fa-solid fa-utensils"></i>

<%=restaurant.getCuisineType()%>

</div>

<div class="info">

<i class="fa-solid fa-location-dot"></i>

<%=restaurant.getAddress()%>

</div>

<div class="info">

<i class="fa-solid fa-motorcycle"></i>

<%=restaurant.getDeliveryTime()%> mins

</div>

<div class="cost">

💰 ₹<%=restaurant.getCostForTwo()%> for two

</div>

<div class="desc">

<%=restaurant.getDescription()%>

</div>

<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">

<button class="btn-menu">

View Menu →

</button>

</a>

</div>

</div>

</div>

<%
}
}
%>
</div>

</div>

<!-- ================= FOOTER ================= -->

<footer>

<div class="container">

<div class="row">

<div class="col-md-4">

<h4 style="color:#E23744;">
🍽 FoodieHub
</h4>

<p>
Discover the best restaurants near you.
</p>

</div>

<div class="col-md-4">

<h5>Quick Links</h5>

<p><a href="home.jsp" style="color:white;text-decoration:none;">Home</a></p>

<p><a href="restaurants" style="color:white;text-decoration:none;">Restaurants</a></p>

<p><a href="#" style="color:white;text-decoration:none;">Orders</a></p>

<p><a href="logout" style="color:white;text-decoration:none;">Logout</a></p>

</div>

<div class="col-md-4">

<h5>Contact</h5>

<p>📍 Nellore, Andhra Pradesh</p>

<p>📞 +91 9876543210</p>

<p>📧 support@foodiehub.com</p>

</div>

</div>

<hr>

<p>

© 2026 FoodieHub. All Rights Reserved.

</p>

</div>

</footer>

<!-- ================= SEARCH SCRIPT ================= -->

<script>

function searchRestaurant(){

let input=document.getElementById("searchInput").value.toLowerCase();

let cards=document.getElementsByClassName("restaurant-item");

for(let i=0;i<cards.length;i++){

let text=cards[i].innerText.toLowerCase();

if(text.indexOf(input)>-1){

cards[i].style.display="block";

}
else{

cards[i].style.display="none";

}

}

}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>