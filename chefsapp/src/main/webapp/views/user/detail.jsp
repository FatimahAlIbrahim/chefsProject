<jsp:include page="../shared/layout.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<h1>User Details</h1>
	<div id="userInfo">
	<p>First Name: ${user.getFirstName()}</p>
	<p>Last Name: ${user.getLastName()}</p>
	<p>Email Address: ${user.getEmailAddress()}</p>
	<button id="editInfo" type="button">Edit Information</button>
	</div>
	
	<div id="editUser" style="display: none;">
	
	<form action="${appName}user/edit" method="post">
	<div>
		<label>First Name</label>
		<input name="firstName" type="text" value="${user.getFirstName()}">
	</div>

	<div>
		<label>Last Name</label>
		<input name="lastName" type="text" value="${user.getLastName()}">
	</div>
	
	<div>
		<label>Password</label>
		<input name="password" type="password">
	</div>
	
	<input name="emailAddress" type="hidden" value="${user.getEmailAddress()}">
	<input name="role" type="hidden" value="ROLE_USER">
	<input name="userId" type="hidden" value="${user.getUserId()}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button type="submit">Edit</button>
	</form>
	</div> 
	
	<button id="shareUserButton" type="button">Share Chef</button>
	<div id="shareUserDiv" style= "display: none;">
		<p>QR code</p>
		<img src="${appName}user/detail/qrcode?email=${user.getEmailAddress()}" width="100" height="100">
		<a href="${appName}user/detail/qrcode/download?email=${user.getEmailAddress()}">Download QRCode</a>
	</div>