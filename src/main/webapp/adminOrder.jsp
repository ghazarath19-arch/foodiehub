<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodiehub.model.Order"%>

<%
List<Order> orderList =
(List<Order>)request.getAttribute("orderList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Manage Orders</title>

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

.table{

vertical-align:middle;

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

Manage Orders

</h2>

</div>

<div class="card">

<div class="card-body">

<div class="table-responsive">

<table class="table table-hover align-middle">

<thead class="table-danger">

<tr>

<th>Order ID</th>

<th>User ID</th>

<th>Restaurant ID</th>

<th>Total Amount</th>

<th>Payment</th>

<th>Status</th>

<th>Order Date</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(orderList!=null){

for(Order order : orderList){

%>

<tr>

<td>

<%=order.getOrderId()%>

</td>

<td>

<%=order.getUserId()%>

</td>

<td>

<%=order.getRestaurantId()%>

</td>

<td>

₹ <%=order.getTotalAmount()%>

</td>

<td>

<%=order.getPaymentMode()%>

</td>
<td>

<form action="adminOrders" method="get">

<input
type="hidden"
name="action"
value="update">

<input
type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<select
name="status"
class="form-select form-select-sm">

<option value="PLACED"
<%=order.getStatus().equals("PLACED") ? "selected" : ""%>>

PLACED

</option>

<option value="PREPARING"
<%=order.getStatus().equals("PREPARING") ? "selected" : ""%>>

PREPARING

</option>

<option value="OUT_FOR_DELIVERY"
<%=order.getStatus().equals("OUT_FOR_DELIVERY") ? "selected" : ""%>>

OUT FOR DELIVERY

</option>

<option value="DELIVERED"
<%=order.getStatus().equals("DELIVERED") ? "selected" : ""%>>

DELIVERED

</option>

<option value="CANCELLED"
<%=order.getStatus().equals("CANCELLED") ? "selected" : ""%>>

CANCELLED

</option>

</select>

</td>

<td>

<%=order.getOrderDate()%>

</td>

<td>

<button
type="submit"
class="btn btn-success btn-sm">

<i class="fa-solid fa-floppy-disk"></i>

Update

</button>

</form>

</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="8" class="text-center">

No Orders Found

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

Order Management System

</p>

</div>

<div class="col-md-6 text-md-end">

<p>

Manage Customer Orders Efficiently

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