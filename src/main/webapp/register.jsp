<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.foodiehub.model.Restaurant" %>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub Restaurants</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f8f9fa;
}

h2{
    color:#d63384;
    font-weight:bold;
    margin:30px;
}

.card{
    transition:0.3s;
    border:none;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 10px rgba(0,0,0,.15);
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 8px 20px rgba(0,0,0,.25);
}

.card img{
    height:220px;
    object-fit:cover;
}

.card-title{
    color:#d63384;
    font-weight:bold;
}

.rating{
    color:green;
    font-weight:bold;
}

.delivery{
    color:#ff5722;
}

a{
    text-decoration:none;
    color:black;
}

</style>

</head>

<body>

<div class="container">

<h2 class="text-center">🍴 FoodieHub Restaurants</h2>

<div class="row">

<%
if(restaurants!=null){

for(Restaurant restaurant:restaurants){
%>

<div class="col-md-4 mb-4">

<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">

<div class="card">

<img src="<%=request.getContextPath()%>/images/<%=restaurant.getImageUrl()%>"
alt="Restaurant Image">

<div class="card-body">

<h4 class="card-title">
<%=restaurant.getRestaurantName()%>
</h4>

<p>
<b>Cuisine :</b>
<%=restaurant.getCuisineType()%>
</p>

<p class="rating">
⭐ <%=restaurant.getRating()%>
</p>

<p class="delivery">
🚚 <%=restaurant.getDeliveryTime()%> mins
</p>

<p>
📍 <%=restaurant.getAddress()%>
</p>

</div>

</div>

</a>

</div>

<%
}
}
%>

</div>

</div>

</body>
</html>