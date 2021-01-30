<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chefs APP</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../css/myStyles.css">
<link rel="stylesheet" href="css/myStyles.css">
</head>
<body>
<h2 style="display:inline;margin:10px 20px;">${Title}</h2>



<% if(session.getAttribute("user") != null) { %>


<a href="${appName}chefs/index">Chefs</a>|
<a href="${appName}recipe/index">Recipes</a>|

<a href="${appName}recipe/add">Add Recipe</a>

<div style="text-align:right; float:right;">

<b>Welcome, ${user.getFirstName()} ${user.getLastName()}</b>
<a href="${appName}user/logout">Logout</a>
</div>

<% } else { %>


<a href="${appName}user/add">Chefs</a>
<a href="${appName}recipe/index">Recipes</a>

<div style="text-align:right; float:right;">

<a href="${appName}user/login">Login</a>
<a href="${appName}user/signUp">Sign Up</a>
</div>

<% } %>

<hr>

</body>
</html>