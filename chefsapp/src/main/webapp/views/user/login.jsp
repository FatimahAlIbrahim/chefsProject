<jsp:include page="../shared/layout.jsp"></jsp:include>

<form action="${appName}login" method="post">

	<div>
		<label>Email Address</label>
		<input name="username" type="text" required>
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password" required>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<button type="submit">Submit</button>

</form>
