<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />

	<div class="form-group">

		<label>Recipe name </label> <input type="text" name="title" value="${recipe.name}" class="form-control">
	</div> --%>
<!-- --------------------------------------- -->
<input type="hidden" name="id" value="${recipe.id}">


<div class="container">
	<div class="row">


		<div class="col">
			<img alt="recipeImg" src="${ recipe.picture}">
		</div>

		<div class="row">
			<div class="col">
				<h1>Hiii ${ recipe.name}</h1>
			</div>
		</div>
		<div class="row">

			<div class="col">${recipe.cuisine}</div>
			<div class="col">${recipe.duration}</div>
			<div class="col">${recipe.servings}</div>
			<div class="col">${recipe.calories}</div>
			<div class="col">${recipe.allergyWarnings}</div>
			<div class="col">${recipe.type}</div>
		</div>
		<div class="row">

			<div class="col">${recipe.description}</div>
		</div>
		<div class="row">

			<div class="col">${recipe.ingredients}</div>
			<div class="col">${recipe.instructions}</div>
		</div>


<!-- 		<div class="w-100"></div>
 -->		
	</div>
<div class="container">
     <h1>${recipe.name}</h1>
    <div class="row">
        <div class="col-md-4">
            <div class="imgAbt">
                <img width="220" height="220" src="img/me.jpg" />
            </div>
        </div>
        <div class="col-md-8">
            <p>${recipe.type}|</p>
            <p>${recipe.servings}</p>
            <p>${recipe.calories}</p>
            <p>${recipe.description}</p>
            <p>${recipe.ingredients}</p>
            <p>${recipe.allergyWarnings}</p>
            <p>${recipe.instructions}</p>
            <p>${recipe.cuisine}</p>
            <p>${recipe.duration}</p> 
            
            
            
           
        </div>
    </div>
</div>
	<!-- <div>  -->
<%-- 	<p>${recipe.type}</p>

</div>

<!-- --------------------------------------- -->

<%-- 	   

	<div> 
	<p>${recipe.type}</p>

		<lable> from ${recipe.cuisine} cuisine  </lable>
        <lable> Enough for ${recipe.servings}  persons </lable>
	   <lable>   Ingredients   </lable>
	    <p> ${recipe.ingredients} </p>
	    <lable> description </lable>
		<p> ${recipe.description}</p>
		 <lable> description </lable>
		<p>${recipe.calories}</p>
	</div>
 --%>
<%-- 	<div class="form-group">
		<label>User</label>
		<select name="users" class="form-control" multiple="multiple">
			<c:forEach items="${users}" var="user">
				<option value="${user.id}"> ${user.name} </option>
			</c:forEach>	
		</select>

	</div>
	 --%>

  
	<input type="hidden" name="id" value="${recipe.id}">

	</div> --%>





<!-- <button type="submit">Submit</button> -->


</form>
	<!--user rating -->
	<div class="main">
	<label>Rate the recipe:</label>
	 <i class="fa fa-star checked" id="1"></i> 
   <i class="fa fa-star unchecked" id="2"></i>
   <i class="fa fa-star unchecked" id="3"></i>
   <i class="fa fa-star unchecked" id="4"></i>
   <i class="fa fa-star unchecked" id="5"></i>
	</div>
	
	 <div>
  <button class="btn" id="buttonnew">Submit rating</button>
  </div>


<button id="shareUserButton" type="button">Share Recipe</button>
<div id="shareUserDiv" style="display: none;">
	<p>QR code</p>
	<img src="${appName}recipe/detail/qrcode?id=${recipe.getId()}"
		width="100" height="100"> <a
		href="${appName}recipe/detail/qrcode/download?id=${recipe.getId()}">Download
		QRCode</a>
</div>
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