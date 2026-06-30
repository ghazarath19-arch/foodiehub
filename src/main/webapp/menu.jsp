<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.foodiehub.model.Menu"%>

<%
List<Menu> menuList=(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Menu</title>

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

color:white;

text-align:center;

}

.hero h1{

font-size:54px;

font-weight:700;

}

.hero p{

font-size:20px;

margin-top:10px;

}

/* ================= SEARCH ================= */

.search-box{

margin-top:25px;

width:70%;

max-width:700px;

position:relative;

}

.search-box input{

width:100%;

padding:15px 20px 15px 55px;

border:none;

outline:none;

border-radius:40px;

font-size:18px;

box-shadow:0 8px 20px rgba(0,0,0,.2);

}

.search-box i{

position:absolute;

left:20px;

top:18px;

font-size:20px;

color:#E23744;

}

/* ================= CATEGORY ================= */

.categories{

margin-top:25px;

}

.categories .btn{

margin:5px;

padding:10px 22px;

border-radius:30px;

background:white;

color:#E23744;

font-weight:600;

border:none;

transition:.3s;

}

.categories .btn:hover{

background:#E23744;

color:white;

transform:translateY(-3px);

}

.heading{

margin:40px 0;

text-align:center;

font-size:40px;

font-weight:700;

color:#E23744;

}
/* ================= MENU CARD ================= */

.menu-card{

background:white;

border-radius:20px;

overflow:hidden;

box-shadow:0 8px 20px rgba(0,0,0,.10);

transition:.35s;

cursor:pointer;

height:100%;

position:relative;

}

.menu-card:hover{

transform:translateY(-10px);

box-shadow:0 18px 35px rgba(0,0,0,.18);

}

.menu-card img{

width:100%;

height:220px;

object-fit:cover;

}

.card-body{

padding:18px;

}

.food-name{

font-size:23px;

font-weight:700;

color:#222;

margin-bottom:8px;

}

.rating{

position:absolute;

top:235px;

right:15px;

background:#24963F;

color:white;

padding:5px 12px;

border-radius:20px;

font-size:14px;

font-weight:600;

}

.price{

font-size:22px;

font-weight:700;

color:#E23744;

margin-top:10px;

}

.desc{

font-size:15px;

color:#666;

margin-top:10px;

height:45px;

overflow:hidden;

}

.available{

display:inline-block;

background:#28a745;

color:white;

padding:4px 12px;

border-radius:20px;

font-size:13px;

font-weight:600;

margin-top:10px;

}

.btn-cart{

width:100%;

margin-top:18px;

padding:12px;

background:#E23744;

color:white;

border:none;

border-radius:30px;

font-size:17px;

font-weight:600;

transition:.3s;

}

.btn-cart:hover{

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

color:#ddd;

}

/* ================= RESPONSIVE ================= */

@media(max-width:768px){

.hero h1{

font-size:38px;

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

<a class="nav-link" href="#">

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

<!-- ================= HERO ================= -->

<div class="hero">

<h1>Delicious Food Menu</h1>

<p>Choose your favourite dishes</p>

<div class="search-box">

<i class="fa-solid fa-magnifying-glass"></i>

<input
type="text"
id="searchInput"
placeholder="Search food items..."
onkeyup="searchFood()">

</div>

<div class="categories">

<button class="btn">🍕 Pizza</button>

<button class="btn">🍔 Burger</button>

<button class="btn">🍗 Chicken</button>

<button class="btn">🥘 Biryani</button>

<button class="btn">🍜 Chinese</button>

<button class="btn">🥗 Veg</button>

</div>

</div>

<div class="container">

<h2 class="heading">

🍽 Restaurant Menu

</h2>

<div class="row g-4" id="menuContainer">
<%
if(menuList != null){

for(Menu menu : menuList){

String image = menu.getImageUrl();

if(image == null || image.trim().equals("")){
    image="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=900&q=80";
}
%>

<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 menu-item">

<div class="menu-card">

<div class="favorite">

<i class="fa-regular fa-heart"></i>

</div>

<img src="<%=image%>"

alt="<%=menu.getItemName()%>">

<div class="card-body">

<h4 class="food-name">

<%=menu.getItemName()%>

<span class="rating">

⭐ <%=menu.getRating()%>

</span>

</h4>

<p class="desc">

<%=menu.getDescription()%>

</p>

<div class="mt-2">

<span class="badge bg-danger">

<%=menu.getCategory()%>

</span>

<span class="available">

🟢 Available

</span>

</div>

<div class="price">

₹ <%=menu.getPrice()%>

</div>

<div class="mt-3">

<a href="cart?action=add&menuId=<%=menu.getMenuId()%>&restaurantId=<%=menu.getRestaurantId()%>">

<button class="btn-cart">

<i class="fa-solid fa-cart-shopping"></i>

Add to Cart

</button>

</a>

</div>

</div>

</div>

</div>

<%
}
}
else{
%>

<div class="col-12">

<div class="alert alert-warning text-center">

No menu items available.

</div>

</div>

<%
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
Fresh Food • Fast Delivery • Happy Customers
</p>

</div>

<div class="col-md-4">

<h5>Quick Links</h5>

<p><a href="restaurants" style="color:white;text-decoration:none;">Restaurants</a></p>

<p><a href="cart" style="color:white;text-decoration:none;">Cart</a></p>

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

function searchFood(){

let input=document.getElementById("searchInput").value.toLowerCase();

let cards=document.getElementsByClassName("menu-item");

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

/* ---------- Category Filter ---------- */

const buttons=document.querySelectorAll(".categories .btn");

buttons.forEach(function(btn){

btn.addEventListener("click",function(){

let category=this.innerText.toLowerCase();

let cards=document.getElementsByClassName("menu-item");

for(let i=0;i<cards.length;i++){

let text=cards[i].innerText.toLowerCase();

if(category.includes("pizza") && text.includes("pizza"))
cards[i].style.display="block";

else if(category.includes("burger") && text.includes("burger"))
cards[i].style.display="block";

else if(category.includes("chicken") && text.includes("chicken"))
cards[i].style.display="block";

else if(category.includes("biryani") && text.includes("biryani"))
cards[i].style.display="block";

else if(category.includes("chinese") && text.includes("chinese"))
cards[i].style.display="block";

else if(category.includes("veg") && text.includes("veg"))
cards[i].style.display="block";

else
cards[i].style.display="none";

}

});

});

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>