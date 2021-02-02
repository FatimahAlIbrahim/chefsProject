<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />

	<div class="form-group">
		<label>Recipe name </label> <input type="text" name="title" value="${recipe.name}" class="form-control">
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

<script src="../js/rate.js" type="text/javascript"></script>
<script src="js/rate.js" type="text/javascript"></script>