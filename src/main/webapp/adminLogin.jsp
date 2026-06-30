<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>FoodieHub | Admin Login</title>

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

background:linear-gradient(135deg,#E23744,#ff6b6b);

display:flex;

justify-content:center;

align-items:center;

height:100vh;

}

.login-card{

background:white;

width:430px;

padding:40px;

border-radius:20px;

box-shadow:0 12px 30px rgba(0,0,0,.2);

}

.logo{

text-align:center;

font-size:60px;

color:#E23744;

margin-bottom:10px;

}

.title{

text-align:center;

font-size:32px;

font-weight:700;

color:#E23744;

margin-bottom:5px;

}

.subtitle{

text-align:center;

color:#666;

margin-bottom:30px;

}

.form-control{

height:50px;

border-radius:12px;

margin-bottom:20px;

}

.btn-login{

width:100%;

height:50px;

border:none;

border-radius:30px;

background:#E23744;

color:white;

font-size:18px;

font-weight:600;

transition:.3s;

}

.btn-login:hover{

background:#c71c31;

}

.error{

color:red;

text-align:center;

margin-bottom:15px;

font-weight:600;

}

</style>

</head>

<body>
<div class="login-card">

<div class="logo">

<i class="fa-solid fa-user-shield"></i>

</div>

<div class="title">

Admin Login

</div>

<div class="subtitle">

FoodieHub Administration Panel

</div>

<%

String error=(String)request.getAttribute("errorMessage");

if(error!=null){

%>

<div class="error">

<%=error%>

</div>

<%

}

%>

<form action="adminLogin" method="post">

<div class="mb-3">

<label class="form-label">

Email Address

</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Enter admin email"
required>

</div>

<div class="mb-3">

<label class="form-label">

Password

</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Enter password"
required>

</div>

<button
type="submit"
class="btn-login">

<i class="fa-solid fa-right-to-bracket"></i>

Login

</button>

</form>

<br>

<div class="text-center">

<a href="login.jsp"
style="text-decoration:none;">

← Back to User Login

</a>

</div>

</div>
<div class="text-center mt-4">

<hr>

<p class="text-muted">

© 2026 <b>FoodieHub</b> Admin Panel

</p>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>