<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />


<div class="container-fluid" style="height: 100vh;">
	<h1></h1>
	<div class="row">
		<div class="col-sm-2">
			<p>Select the type of meal</p>

			<form action="${appName}recipe/index" method="get">
				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="All" id="All" required> <label
						class="form-check-label" for="Arapic"> All</label>
				</div>
				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="Soup" id="Soup"> <label class="form-check-label"
						for="Arapic"> Soup</label>
				</div>
				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="Appetizer" id="defaultCheck2"> <label
						class="form-check-label" for="defaultCheck2"> Appetizer </label>
				</div>

				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="Salad" id="defaultCheck2"> <label
						class="form-check-label" for="defaultCheck2"> Salad </label>
				</div>
				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="Main Course" id="defaultCheck2"> <label
						class="form-check-label" for="defaultCheck2"> Main Course
					</label>
				</div>
				<div class="form-check">
					<input name="first" class="form-check-input" type="radio"
						value="Dessert" id="defaultCheck2"> <label
						class="form-check-label" for="defaultCheck2"> Dessert </label>
				</div>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<button id="submit" type="submit" class="btn btn-primary">Filter</button>
			</form>
		</div>
		<div class="col-sm-10">

			<div class="row row-cols-1 row-cols-md-3 g-4">


	<div class="col" style= "margin-top:10px; width:25%;">
    <div class="card h-100">
      <img src="${recipe.picture }" class="card-img-top" alt="...">
      <div class="card-body">
       	<a href="${appName}recipe/detail?id=${recipe.id}"><h5 class="card-title">${recipe.name }</h5> </a>
        <p class="card-text">${recipe.servings}</p>
      </div>
      <div class="card-footer">
   <c:forEach var="i" begin="1" end="${rates[0][status.index]}" step="1">
   <i class="fa fa-star checked" id=i></i>
</c:forEach>
   <c:forEach var="i" begin="1" end="${5-rates[0][status.index]}" step="1">
   <i class="fa fa-star unchecked" id=i></i>
</c:forEach>
   <!--    <div class="main">
	 <i class="fa fa-star unchecked" id="1"></i> 
   <i class="fa fa-star unchecked" id="2"></i>
   <i class="fa fa-star unchecked" id="3"></i>
   <i class="fa fa-star unchecked" id="4"></i>
   <i class="fa fa-star unchecked" id="5"></i>
	</div> -->
     <%--    <small class="text-muted">${rates[0][status.index]}</small> --%>
      </div>
       <div class="card-footer">
      
       </div>
    </div>
  </div>

					<div class="col" style="margin-top: 10px; width: 25%;">
						<div class="card h-100">
							<img src="${recipe.picture }" class="card-img-top" alt="...">
							<div class="card-body">
								<a href="${appName}recipe/detail?id=${recipe.id}"><h5
										class="card-title">${recipe.name }</h5> </a>
								<p class="card-text">${recipe.servings}</p>
							</div>
							<div class="card-footer">

								<small class="text-muted">${rates[0][status.index]}</small>
							</div>
						</div>
					</div>






