<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />
<table class="table table-striped">
	<tr>
		<th>Chef Name</th>
		<th>Email Address</th>		
		<th>Actions</th>
		
	</tr>
	<c:forEach items="${users}" var="user">
		<tr>
			<td><a href="${appName}user/detail?id=${user.id}">${user.name}</a></td>
			<td>${user.emailAddress}</td>
			
			<td><a href="${appName}user/edit?id=${user.id}">Edit</a>
			
		<!-- if it is Admin , show delete link ---->
			 | <a href="${appName}user/delete?id=${user.id}">Delete</a></td>
			 
		
		</tr>
	</c:forEach>
</table>