<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />


<div class="container-fluid">
	<h1>Hello World!</h1>
	<div class="row">
		<div class="col-sm-3" style="background-color: yellow;">
			<p>hhhh
			<div class="form-check">
				<input name ="first" class="form-check-input" type="checkbox" value="hhh" id="Arapic" >
				<label class="form-check-label" for="Arapic"> Default
					checkbox </label>
			</div>
			<div class="form-check">
				<input  name ="first" class="form-check-input" type="checkbox" value=""
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Default checkbox </label>
			</div>

			<div class="form-check">
				<input  name ="first" class="form-check-input" type="checkbox" value=""
					id="defaultCheck2"> <label class="form-check-label"
					for="defaultCheck2"> Default checkbox </label>
			</div>
		</div>
		<div class="col-sm-9" style="background-color: pink;">
<%! String[] tayps; %>
<% 
   tayps = request.getParameterValues("first");
%>

<c:forEach items="${recipes}" var="recipe">

		<div class="card">
			<img class="card-img-top" src="${recipe.picture }"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">${recipe.name }</h5>
				<p class="card-text">${recipe.servings }</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>



</c:forEach>

</div>





