<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodiehub.model.User" %>

<%
    List<User> userList = (List<User>) request.getAttribute("userList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>

    <style>

        body{
            margin:0;
            font-family:Arial,sans-serif;
            background:#eef5ff;
        }

        header{
            background:#a32020;
            color:white;
            padding:18px;
            font-size:28px;
            font-weight:bold;
        }

        .container{
            width:95%;
            margin:30px auto;
        }

        h2{
            color:#333;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
            border-radius:10px;
            overflow:hidden;
        }

        th{
            background:#f7c6cf;
            padding:12px;
        }

        td{
            padding:12px;
            text-align:center;
            border-bottom:1px solid #ddd;
        }

        .deleteBtn{
            background:#dc3545;
            color:white;
            padding:8px 14px;
            text-decoration:none;
            border-radius:5px;
        }

        .dashboardBtn{
            float:right;
            background:#343a40;
            color:white;
            padding:10px 18px;
            text-decoration:none;
            border-radius:6px;
        }

    </style>

</head>

<body>

<header>

    🍽 FoodieHub Admin

    <a href="adminDashboard"
       class="dashboardBtn">
        Dashboard
    </a>

</header>

<div class="container">

    <h2>Manage Users</h2>

    <table>

        <tr>

            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>

        </tr>

        <%
            if(userList!=null){

                for(User user:userList){
        %>

        <tr>

            <td><%=user.getUserId()%></td>

            <td><%=user.getFullName()%></td>

            <td><%=user.getEmail()%></td>

            <td><%=user.getPhone()%></td>

            <td><%=user.getAddress()%></td>

            <td><%=user.getRole()%></td>

            <td><%=user.getStatus()%></td>

            <td>

                <a class="deleteBtn"
                   href="adminUsers?action=delete&userId=<%=user.getUserId()%>"
                   onclick="return confirm('Delete this user?')">

                    Delete

                </a>

            </td>

        </tr>

        <%
                }
            }
        %>

    </table>

</div>

</body>
</html>