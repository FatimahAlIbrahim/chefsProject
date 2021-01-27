<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>User Details</h1>
	<p>First Name: ${user.getFirstName()}</p>
	<p>Last Name: ${user.getLastName()}</p>
	<p>Email Address: ${user.getEmailAddress()}</p>

</body>
</html>