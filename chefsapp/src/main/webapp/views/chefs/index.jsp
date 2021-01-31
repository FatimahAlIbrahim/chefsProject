<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../shared/layout.jsp" />
<table class="table table-striped">
	<tr>
		<th>Chef Name</th>
		<th>Email Address</th>		
		<th>Actions</th>
		
	</tr>
	<c:forEach items="${chefs}" var="user">
		<tr>
<%-- 				<fmt:parseNumber var = "parseduserId" type = "number" value = "${user.userId}"/>
 --%>		
		
<%-- 		<td><a href="${appName}user/detail?id=${user.userId}">${user.firstName}</a></td>
 --%>		
<%--  <fmt:parseNumber var = "parseduserId" type = "number" value = "${user.userId}"/>
 --%>				
 <td>  <a href="${appName}user/detail?id=${user.userId}">${user.firstName}</a> 
				
				<%--  <c:out value="${user.user_id}" /> --%>
				</td>
		
	
<%--  			<td><a href="${appName}user/detail?id=parseduserId">${user.firstName}</a></td>
 --%> 
<%-- 			<td>${user.emailAddress}</td>
 --%>			
 			<td>${user.emailAddress}</td>
 
<%-- 			<td><a href="${appName}user/edit?id=${user.userId}">Edit</a>
 --%>		
			
		<!-- if it is Admin , show delete link ---->
<%-- 			 | <a href="${appName}user/delete?id=${user.userId}">Delete</a></td>
 --%>			 
		
		</tr>
	</c:forEach>
</table>