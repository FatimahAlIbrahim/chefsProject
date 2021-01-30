<jsp:include page="../shared/layout.jsp"></jsp:include>

<form action="${appName}user/login" method="post">

	<div>
		<label>Email Address</label>
		<input name="emailAddress" type="email" required>
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password" required>
	</div>
	
	<button type="submit">Submit</button>

</form>
