<jsp:include page="../shared/layout.jsp"></jsp:include>

<p class="h3 color2">Login</p>

<form action="${appName}login" method="post" class="color2">

	<div class="mb-3">
		<label class="form-label">Email Address</label>
		<input name="username" type="text" class="form-control" required>
	</div>
	
	<div class="mb-3">
		<label class="form-label">Password</label>
		<input name="password" type="password" class="form-control" required>
	</div>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<button type="submit" class="btn btn-primary mb-3">Submit</button>

</form>
