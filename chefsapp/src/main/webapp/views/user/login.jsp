<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>login page</h1>
<h6>${message}</h6>

<form action="/chefsapp/user/login" method="post">

	<div>
		<label>Email Address</label>
		<input name="emailAddress" type="email">
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password">
	</div>
	
	<button type="submit">Submit</button>

</form>

</body>
</html>