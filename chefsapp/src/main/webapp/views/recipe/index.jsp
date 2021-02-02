<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />


<div class="container-fluid" style ="height: 100vh;">
	<h1></h1>
	<div class="row">
		<div class="col-sm-2" >
			<p>Select the type of meal </p>
			
			<form  action="${appName}recipe/index" method="get" >
			<div class="form-check">
				<input name ="first" class="form-check-input" type="radio" value="All" id="All" >
				<label class="form-check-label" for="Arapic"> All</label>
			</div>
			<div class="form-check">
				<input name ="first" class="form-check-input" type="radio" value="Soup" id="Soup" >
				<label class="form-check-label" for="Arapic"> Soup</label>
			</div>
			<div class="form-check">
				<input  name ="first" class="form-check-input" type="radio" value="Appetizer"
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Appetizer </label>
			</div>

			<div class="form-check">
				<input  name ="first" class="form-check-input" type="radio" value="Salad"
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Salad </label>
			</div>
				<div class="form-check">
				<input  name ="first" class="form-check-input" type="radio" value="Main Course"
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Main Course </label>
			</div>
				<div class="form-check">
				<input  name ="first" class="form-check-input" type="radio" value="Dessert"
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Dessert </label>
			</div>
		
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<button id="submit" type="submit" class="btn btn-primary">Filter</button>
		</form>
		</div>
		<div class="col-sm-10">
<%-- <%! String[] tayps; %>
<% 
   tayps = request.getParameterValues("first");
%> --%>
<div class="row row-cols-1 row-cols-md-3 g-4" >

<c:forEach items="${recipes}" var="recipe" varStatus="status">

	<div class="col" style= "margin-top:10px; width:25%;">
    <div class="card h-100">
      <img src="${recipe.picture }" class="card-img-top" alt="...">
      <div class="card-body">
       	<a href="${appName}recipe/detail?id=${recipe.id}"><h5 class="card-title">${recipe.name }</h5> </a>
        <p class="card-text">${recipe.servings}</p>
      </div>
      <div class="card-footer">
      
        <small class="text-muted">${rates[0][status.index]}</small>
      </div>
    </div>
  </div>


</c:forEach>
</div>
</div>
</div>
</div>

<%-- <td><a href="${appName}doctor/edit?id=${doctor.id}">Edit</a> | <a
				href="${appName}doctor/delete?id=${doctor.id}">Delete</a></td> --%>


<%-- <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
      <img src="${recipe.picture }" class="card-img-top" alt="...">
      <div class="card-body">
       	<a href="${appName}recipe/detail?id=${recipe.id}"> <h5 class="card-title">${recipe.name }</h5> </a>
        <p class="card-text">${recipe.servings}</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 3 mins ago</small>
      </div>
    </div>
  </div>
</div> --%>
