<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>sign up page</h1>
<h6>${message}</h6>

<form action="/chefsapp/user/signup" method="post">

	<div>
		<label>First Name</label>
		<input name="firstName" type="text">
	</div>

	<div>
		<label>Last Name</label>
		<input name="lastName" type="text">
	</div>
	
	<div>
		<label>Email Address</label>
		<input name="emailAddress" type="email">
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password">
	</div>
	
	<input name="role" type="hidden" value="ROLE_USER">
	
	<button type="submit">Submit</button>

</form>
</body>
</html>