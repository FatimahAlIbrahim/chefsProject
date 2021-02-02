<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../shared/layout.jsp" />

<%-- <div class="form-group">

		<label>Recipe name </label> <input type="text" name="title" value="${recipe.name}" class="form-control">
	</div> --%>
<!-- --------------------------------------- -->
<input type="hidden" name="id" value="${recipe.id}">


<div class="container">
	<div class="row">


		<div class="col" id="recipeDetailImg">
			<img alt="recipeImg" src="${ recipe.picture}">
		</div>

		<div class="w-100"></div>

		<div class="col">
			<h1 id="recipeDetailName">Hiii ${ recipe.name}</h1>
		</div>

		<div class="w-100"></div>


		<div class="col">
			<span>cuisine</span> ${recipe.cuisine}
		</div>
		|
		<div class="col">
			<span>duration</span> ${recipe.duration}
		</div>
		|
		<div class="col">
			<span>servings</span> ${recipe.servings}
		</div>
		|
		<div class="col">
			<span>calories</span> ${recipe.calories}
		</div>
		|
		<div class="col">
			<span>allergyWarnings</span> ${recipe.allergyWarnings}
		</div>
		|
		<div class="col">
			<span>type</span> ${recipe.type}
		</div>
		<div class="w-100"></div>

		<div class="col" id="recipeDescription">${recipe.description}</div>
		<div class="w-100"></div>

		<div class="col" id="ingredients">
			<h2>Ingredients</h2>${recipe.ingredients}</div>
		<div class="col" id="instructions">
			<h2>Instructions</h2>${recipe.instructions}</div>

	</div>
	<div class="w-25 h-100" style="margin: 0 auto;">
	<button id="shareRecipeButton" type="button"
		class="btn btn-outline-dark w-100">Share Recipe</button>
	<div id="shareUserDiv" style="display: none;">
	<div class="card text-center">
		<img src="${appName}recipe/detail/qrcode?id=${recipe.getId()}"
			width="100" height="100" class="card-img-top"> 
			<div class="card-body">
						<h5 class="card-title">QRCode</h5>
					</div>
					<div class="card-footer">
						<small class="text-muted">
			<a
			href="${appName}recipe/detail/qrcode/download?id=${recipe.getId()}">
			<button class="btn btn-outline-dark" type="button">Download
									QRCode</button></a>
			
			
			</small>
					</div>
			</div>
	</div>
	</div>

</div>

<!-- --------------------------------------- -->

<!--user rating -->
<security:authorize access="isAuthenticated()">

	<c:if test="${!flag}">

		<form id="addRating" action="${appName}recipe/detail" method="post">
			<div class="main form-group">
				<label>Rate the recipe:</label> <i class="fa fa-star checked" id="1"></i>
				<i class="fa fa-star unchecked" id="2"></i> <i
					class="fa fa-star unchecked" id="3"></i> <i
					class="fa fa-star unchecked" id="4"></i> <i
					class="fa fa-star unchecked" id="5"></i>
			</div>
			<div class="form-group">
				<label>Comment: </label> <input type="text" name="comment"
					class="form-control">

			</div>
			<input type="hidden" name="rating" value="1" id="rate"> <input
				type="hidden" name="recipe" value="${recipe.id}"> <input
				type="hidden" name="user" value="${currentUser}"> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<button class="btn btn-primary" id="submitRatingBtn" type="submit">Submit
				rating</button>
		</form>
	</c:if>
</security:authorize>

<script src="../js/rate.js" type="text/javascript"></script>
<script src="js/rate.js" type="text/javascript"></script>