<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Register</title>

<style>

body{
    font-family: Arial, sans-serif;
    background:#f5f5f5;
}

.container{
    width:400px;
    margin:60px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0px 0px 10px gray;
}

h2{
    text-align:center;
    color:#ff4d4d;
}

input,textarea{
    width:100%;
    padding:10px;
    margin-top:8px;
    margin-bottom:15px;
}

button{
    width:100%;
    padding:10px;
    background:#ff4d4d;
    color:white;
    border:none;
    font-size:18px;
    cursor:pointer;
}

button:hover{
    background:#e63946;
}

a{
    text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h2>FoodieHub Registration</h2>

<form action="register" method="post">

<label>Full Name</label>
<input type="text" name="fullName" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Phone Number</label>
<input type="text" name="phone" required>

<label>Password</label>
<input type="password" name="password" required>

<label>Address</label>
<textarea name="address"></textarea>

<button type="submit">Register</button>

</form>

<br>

Already have an account?
<a href="login.jsp">Login</a>

</div>

</body>
</html>