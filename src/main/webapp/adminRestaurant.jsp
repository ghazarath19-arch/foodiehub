<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodiehub.model.Restaurant"%>

<%
List<Restaurant> restaurantList =
(List<Restaurant>)request.getAttribute("restaurantList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Manage Restaurants</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:Poppins,sans-serif;

}

.navbar{

background:#E23744;

}

.navbar-brand{

color:white!important;

font-size:28px;

font-weight:bold;

}

.card{

border:none;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.1);

}

.table img{

width:80px;

height:60px;

border-radius:8px;

object-fit:cover;

}

.btn-add{

background:#E23744;

color:white;

}

.btn-add:hover{

background:#c81d2f;

color:white;

}

</style>

</head>

<body>
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container">

<a class="navbar-brand" href="adminDashboard">

🍽 FoodieHub Admin

</a>

<div class="ms-auto">

<a href="adminDashboard"
class="btn btn-light">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

</div>

</div>

</nav>

<div class="container mt-5">

<div class="d-flex justify-content-between align-items-center mb-4">

<h2>

Manage Restaurants

</h2>

<a href="adminRestaurants?action=add"
class="btn btn-add">

<i class="fa-solid fa-plus"></i>

Add Restaurant

</a>

</div>

<div class="card">

<div class="card-body">

<div class="table-responsive">

<table class="table table-hover align-middle">

<thead class="table-danger">

<tr>

<th>ID</th>

<th>Image</th>

<th>Name</th>

<th>Cuisine</th>

<th>Rating</th>

<th>Delivery</th>

<th>Phone</th>

<th>Status</th>

<th>Actions</th>

</tr>

</thead>

<tbody>

<%

if(restaurantList!=null){

for(Restaurant restaurant : restaurantList){

%>

<tr>

<td>

<%=restaurant.getRestaurantId()%>

</td>

<td>

<img src="<%=restaurant.getImageUrl()%>">

</td>

<td>

<%=restaurant.getRestaurantName()%>

</td>

<td>

<%=restaurant.getCuisineType()%>

</td>

<td>

⭐ <%=restaurant.getRating()%>

</td>

<td>

<%=restaurant.getDeliveryTime()%> mins

</td>

<td>

<%=restaurant.getPhoneNumber()%>

</td>
<td>

<%

if(restaurant.isActive()){

%>

<span class="badge bg-success">

Active

</span>

<%

}else{

%>

<span class="badge bg-danger">

Inactive

</span>

<%

}

%>

</td>

<td>

<a href="adminRestaurants?action=edit&restaurantId=<%=restaurant.getRestaurantId()%>"
class="btn btn-warning btn-sm">

<i class="fa-solid fa-pen"></i>

Edit

</a>

<a href="adminRestaurants?action=delete&restaurantId=<%=restaurant.getRestaurantId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Are you sure you want to delete this restaurant?');">

<i class="fa-solid fa-trash"></i>

Delete

</a>

</td>

</tr>

<%

}

}

else{

%>

<tr>

<td colspan="9" class="text-center">

No Restaurants Available

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</div>

</div>
<!-- ================= FOOTER ================= -->

<footer
style="margin-top:60px;
background:#222;
color:white;
padding:35px 0;">

<div class="container">

<div class="row">

<div class="col-md-6">

<h4 style="color:#E23744;">

🍽 FoodieHub Admin

</h4>

<p>

Restaurant Management Panel

</p>

</div>

<div class="col-md-6 text-md-end">

<p>

Manage Restaurants Easily

</p>

<p>

© 2026 FoodieHub. All Rights Reserved.

</p>

</div>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>