<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<h2 style="display:inline;margin:10px 20px;">${Title}</h2>



<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.authorities"/>

<a href="${appName}chefs/index">Chefs</a>|
<a href="${appName}recipe/index">Recipes</a>|

<a href="${appName}recipe/add">Add Recipe</a>

<div style="text-align:right; float:right;">

<b>Welcome <security:authentication property="principal.username"/></b>
<a href="${appName}logout">Logout</a>
</div>
	</security:authorize>


	<security:authorize access="!isAuthenticated()">


<a href="${appName}user/add">Chefs</a>
<a href="${appName}recipe/index">Recipes</a>

<div style="text-align:right; float:right;">

<a href="${appName}user/login">Login</a>
<a href="${appName}user/signup">Sign Up</a>
</div>
	</security:authorize>



<hr>
<c:if test="${addRecipeMessage != null}">
		<div class="alert alert-success fade show" role="alert">
			${addRecipeMessage}</div>
		<%
		session.removeAttribute("addRecipeMessage");
		%>
	</c:if>
	
	<c:if test="${addRatingMessage != null}">
		<div class="alert alert-success fade show" role="alert">
			${addRatingMessage}</div>
		<%
		session.removeAttribute("addRatingMessage");
		%>
	</c:if>
	
	<c:if test="${signupFailMessage != null}">
		<div class="alert alert-danger show" role="alert">
			${signupFailMessage}</div>
		<%
		session.removeAttribute("signupFailMessage");
		%>
	</c:if>
	
	<c:if test="${signupSuccessMessage != null}">
		<div class="alert alert-success fade show" role="alert">
			${signupSuccessMessage}</div>
		<%
		session.removeAttribute("signupSuccessMessage");
		%>
	</c:if>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$('.fade').slideUp(4000);
	</script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="../js/main.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>


</body>
</html>