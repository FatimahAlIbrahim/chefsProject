<jsp:include page="../shared/layout.jsp"></jsp:include>
<form action="${appName}user/signup" method="post">

	<div>
		<label>First Name</label>
		<input name="firstName" type="text" required>
	</div>

	<div>
		<label>Last Name</label>
		<input name="lastName" type="text" required>
	</div>
	
	<div>
		<label>Email Address</label>
		<input name="emailAddress" type="email" required>
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password" required>
	</div>
	
	<input name="role" type="hidden" value="ROLE_USER">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<button type="submit">Submit</button>

</form>
