<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../shared/layout.jsp" />

<table class="table table-striped" id="chefsTable">
 <thead>
	<tr>
		<th scope="col">Chef Name</th>
		<th scope="col">Email Address</th>
		<security:authorize access="isAuthenticated()">
			<th scope="col">Actions</th>
		</security:authorize>

	</tr>
	</thead>
	<c:forEach items="${chefs}" var="chef">
		<tr>
			<td><a href="${appName}user/detail?email=${chef[1]}">${chef[0]}</a></td>
			<td>${chef[1]}</td>
		</tr>
	</c:forEach>
</table>