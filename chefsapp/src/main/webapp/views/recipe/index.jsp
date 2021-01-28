<table class="table table-striped">

	<tr>
		<th>Recipe Title</th>
		<th>Recipe Description</th>

	#	<%
			if (session.getAttribute("user") != null) {
		%>
		<th>Actions</th>
		<%
			}
		%>
	</tr>

	<c:forEach items="${recipes}" var="recipe">
		<tr>
			<td><a href="${appName}recipe/detail?id=${recipe.id}">${recipe.title}</a></td>
			<td>${recipe.description}</td>

			<%
				if (session.getAttribute("user") != null) {
			%>
			<td><a href="${appName}recipe/edit?id=${recipe.id}">Edit</a> <%
 	if (session.getAttribute("userRole").equals("admin")) {
 %> | <a href="${appName}recipe/delete?id=${recipe.id}">Delete</a></td>


			<%
				}
			%>

			<%
				}
			%>
		</tr>
	</c:forEach>
</table>