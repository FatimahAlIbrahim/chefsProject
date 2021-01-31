<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />

<form action="${appName}recipe/add" method="post">

	<div class="form-group">
		<label>Recipe Title </label> <input type="text" name="title" value="${recipe.name}" class="form-control">
	</div>

	<div class="form-group">
		<label>Recipe Type</label> <input type="text" name="description" value="${recipe.type}" class="form-control">
		<label>Recipe cusisne </label> <input type="text" name="description" value="${recipe.cusisne}" class="form-control">
		<label>Recipe Description </label> <input type="text" name="description" value="${recipe.servings}" class="form-control">
		<label>Recipe Description </label> <input type="text" name="description" value="${recipe.ingredients}" class="form-control">
		<label>Recipe Description </label> <input type="text" name="description" value="${recipe.description}" class="form-control">
		<label>Recipe Description </label> <input type="text" name="description" value="${recipe.calories}" class="form-control">	
	</div>

	<div class="form-group">
		<label>User</label>
		<select name="users" class="form-control" multiple="multiple">
			<c:forEach items="${users}" var="user">
				<option value="${user.id}"> ${user.name} </option>
			</c:forEach>	
		</select>
	</div>
	
	<input type="hidden" name="id" value="${recipe.id}">

	<button type="submit">Submit</button>

</form>