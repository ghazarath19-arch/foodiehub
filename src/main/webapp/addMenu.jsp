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

<title>Add Menu Item</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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

.navbar{
background:#E23744;
padding:15px 40px;
}

.navbar-brand{
color:white!important;
font-size:28px;
font-weight:bold;
}

.card{
border:none;
border-radius:20px;
box-shadow:0 8px 20px rgba(0,0,0,.1);
}

.card-header{
background:#E23744;
color:white;
font-size:26px;
font-weight:600;
padding:18px;
}

.form-control,
.form-select{
height:48px;
border-radius:10px;
}

textarea.form-control{
height:100px;
}

.btn-save{
background:#E23744;
color:white;
border:none;
padding:12px 30px;
border-radius:30px;
font-weight:600;
}

.btn-save:hover{
background:#c81d2f;
color:white;
}

.btn-cancel{
border-radius:30px;
padding:12px 30px;
font-weight:600;
}

</style>

</head>

<body>
<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

<div class="container-fluid">

<a class="navbar-brand" href="adminDashboard">

🍽 FoodieHub Admin

</a>

<div class="ms-auto">

<a href="adminMenu"
class="btn btn-light">

<i class="fa-solid fa-arrow-left"></i>

Back

</a>

</div>

</div>

</nav>

<div class="container mt-5 mb-5">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card">

<div class="card-header">

<i class="fa-solid fa-bowl-food"></i>

Add New Menu Item

</div>

<div class="card-body">

<form action="adminMenu" method="post">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">

Restaurant

</label>

<select
name="restaurantId"
class="form-select"
required>

<option value="">

Select Restaurant

</option>

<%

for(Restaurant restaurant : restaurantList){

%>

<option value="<%=restaurant.getRestaurantId()%>">

<%=restaurant.getRestaurantName()%>

</option>

<%

}

%>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Item Name

</label>

<input
type="text"
name="itemName"
class="form-control"
required>

</div>

<div class="col-12 mb-3">

<label class="form-label">

Description

</label>

<textarea
name="description"
class="form-control"
required></textarea>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Price (₹)

</label>

<input
type="number"
step="0.01"
name="price"
class="form-control"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Rating

</label>

<input
type="number"
step="0.1"
min="0"
max="5"
name="rating"
class="form-control"
required>

</div>
<div class="col-md-6 mb-3">

<label class="form-label">

Category

</label>

<select
name="category"
class="form-select"
required>

<option value="">Select Category</option>

<option value="Starter">Starter</option>

<option value="Main Course">Main Course</option>

<option value="Biryani">Biryani</option>

<option value="Pizza">Pizza</option>

<option value="Burger">Burger</option>

<option value="Chinese">Chinese</option>

<option value="South Indian">South Indian</option>

<option value="Dessert">Dessert</option>

<option value="Beverage">Beverage</option>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Availability

</label>

<select
name="available"
class="form-select"
required>

<option value="true">

Available

</option>

<option value="false">

Not Available

</option>

</select>

</div>

<div class="col-12 mb-3">

<label class="form-label">

Image URL

</label>

<input
type="text"
name="imageUrl"
class="form-control"
placeholder="https://example.com/image.jpg"
required>

</div>

<div class="col-12 text-center mt-4">

<button
type="submit"
class="btn btn-save">

<i class="fa-solid fa-floppy-disk"></i>

Save Menu Item

</button>

<a href="adminMenu"
class="btn btn-secondary btn-cancel ms-2">

<i class="fa-solid fa-xmark"></i>

Cancel

</a>

</div>

</div>

</form>

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

Menu Management System

</p>

</div>

<div class="col-md-6 text-md-end">

<p>

Add New Menu Items Easily

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