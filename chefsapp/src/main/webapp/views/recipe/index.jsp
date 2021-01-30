<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />
<table class="table table-striped">

	<tr>
		<th>Recipe Name</th>
		<th>Recipe Type</th>
		<th>Recipe Allergy Warnings</th>
		<th>Recipe Servings </th>
		<th>Recipe Calories </th>
		<th>Recipe Cuisine </th>
	<th>Action </th>
</tr>

	    <c:forEach items="${recipes}" var="recipe">
		<tr>
			<td><a href="/chefsapp/recipe/detail?id=${recipe.id}">${recipe.name}</a></td>
			<td>${recipe.type}</td>
			<td>${recipe.allergyWarnings}</td>
			<td>${recipe.servings}</td>
			<td>${recipe.calories}</td>
			<td>${recipe.cuisine}</td>
			<td><a href="/chefsapp/recipe/edit?id=${recipe.id}">Edit</a> 
 	         <a href="/chefsapp/recipe/delete?id=${recipe.id}">Delete</a></td>

</c:forEach>
			
</table>
