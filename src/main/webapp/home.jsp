<%@ page import="com.foodiehub.model.User" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Home</title>

<style>

body{
    font-family: Arial;
    background:#f5f5f5;
}

.container{
    width:80%;
    margin:50px auto;
}

h1{
    color:#e23744;
}

a{
    text-decoration:none;
    margin-right:20px;
    font-size:18px;
}

</style>

</head>

<body>

<div class="container">

<h1>Welcome, <%= user.getFullName() %></h1>

<hr>

<a href="restaurants.jsp">Browse Restaurants</a>

<a href="profile.jsp">Profile</a>

<a href="logout">Logout</a>

</div>

</body>
</html>