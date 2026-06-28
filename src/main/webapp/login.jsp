<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieHub | Login</title>

<style>
body{
    font-family: Arial;
    background:#f5f5f5;
}

.container{
    width:350px;
    margin:80px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}

h2{
    text-align:center;
    color:#ff4d4d;
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
}

button{
    width:100%;
    padding:10px;
    background:#ff4d4d;
    color:white;
    border:none;
    cursor:pointer;
}

button:hover{
    background:#e63946;
}
</style>

</head>
<body>

<div class="container">

<h2>FoodieHub Login</h2>

<form action="login" method="post">

<label>Email</label>
<input type="email" name="email" required>

<label>Password</label>
<input type="password" name="password" required>

<button type="submit">Login</button>

</form>

<br>

Don't have an account?
<a href="register.jsp">Register</a>

</div>

</body>
</html>