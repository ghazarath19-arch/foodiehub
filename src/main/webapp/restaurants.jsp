<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodiehub.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Restaurants</title>

<style>

body{
    font-family: Arial, sans-serif;
    background:#f5f5f5;
}

h1{
    text-align:center;
    color:#E23744;
}

.container{
    width:90%;
    margin:auto;
}

.card{
    width:300px;
    background:white;
    border-radius:10px;
    box-shadow:0px 2px 8px gray;
    padding:15px;
    margin:15px;
    display:inline-block;
}

.card h2{
    color:#E23744;
}

</style>

</head>

<body>

<h1>FoodieHub Restaurants</h1>

<div class="container">

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");

if(restaurants != null){

for(Restaurant restaurant : restaurants){
%>

<div class="card">

<h2><%= restaurant.getRestaurantName() %></h2>

<p><b>Cuisine :</b> <%= restaurant.getCuisineType() %></p>

<p><b>Rating :</b> ⭐ <%= restaurant.getRating() %></p>

<p><b>Delivery :</b> <%= restaurant.getDeliveryTime() %> mins</p>

<p><b>Address :</b> <%= restaurant.getAddress() %></p>

</div>

<%
}
}
%>

</div>

</body>
</html>