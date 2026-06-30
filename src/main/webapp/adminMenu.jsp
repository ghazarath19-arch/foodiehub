<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodiehub.model.Menu"%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Manage Menu</title>

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

border-radius:18px;

box-shadow:0 8px 20px rgba(0,0,0,.10);

}

.table img{

width:80px;

height:60px;

border-radius:10px;

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

<div class="container-fluid">

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

Manage Menu Items

</h2>

<a href="adminMenu?action=add"
class="btn btn-add">

<i class="fa-solid fa-plus"></i>

Add Menu Item

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

<th>Item Name</th>

<th>Restaurant ID</th>

<th>Category</th>

<th>Price</th>

<th>Rating</th>

<th>Status</th>

<th>Actions</th>

</tr>

</thead>

<tbody>

<%

if(menuList!=null){

for(Menu menu : menuList){

%>

<tr>

<td>

<%=menu.getMenuId()%>

</td>

<td>

<img src="<%=menu.getImageUrl()%>">

</td>

<td>

<%=menu.getItemName()%>

</td>

<td>

<%=menu.getRestaurantId()%>

</td>

<td>

<%=menu.getCategory()%>

</td>

<td>

₹ <%=menu.getPrice()%>

</td>

<td>

⭐ <%=menu.getRating()%>

</td>
<td>

<%

if(menu.isAvailable()){

%>

<span class="badge bg-success">

Available

</span>

<%

}else{

%>

<span class="badge bg-danger">

Not Available

</span>

<%

}

%>

</td>

<td>

<a href="adminMenu?action=edit&menuId=<%=menu.getMenuId()%>"
class="btn btn-warning btn-sm">

<i class="fa-solid fa-pen"></i>

Edit

</a>

<a href="adminMenu?action=delete&menuId=<%=menu.getMenuId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Are you sure you want to delete this menu item?');">

<i class="fa-solid fa-trash"></i>

Delete

</a>

</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="9" class="text-center">

No Menu Items Available

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

Menu Management System

</p>

</div>

<div class="col-md-6 text-md-end">

<p>

Manage Menu Items Efficiently

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