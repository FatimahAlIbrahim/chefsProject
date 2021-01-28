<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../shared/layout.jsp" />
<form action="recipe/add" method="post">

	<div class="form-group">
		<label>Picture </label> <input type="text" name="picture"
			class="form-control">
	</div>

	<div class="form-group">
		<label>Name </label> <input type="text" name="name"
			class="form-control">
	</div>
	<div class="form-group">
		<label>Description </label> <input type="text" name="description"
			class="form-control">
	</div>
	<div class="form-group">
		<label>Ingredients </label>
	</div>
	<div class="form-group">
		<label>amount </label> <label>measurement</label> <label>item</label>
	</div>
	<div class="form-group">
		<input type="number" step=".25" class="form-control"> <select>
			<option value="--">--</option>
			<option value="cup">cup</option>
			<option value="tsp">tsp</option>
			<option value="tbsp">tbsp</option>
			<option value="gram">gram</option>
			<option value="mL">mL</option>
		</select> <input type="text" class="form-control">
	</div>
	<input type="hidden" name="ingredients" >

	<div class="form-group">
		<label>Allergy Warnings</label> <select name="allergyWarnings"
			multiple="multiple">
			<option value="--">--</option>
			<option value="Milk">Milk</option>
			<option value="Eggs">Eggs</option>
			<option value="Soy">Soy</option>
			<option value="yeast">yeast</option>
			<option value="peanuts">peanuts</option>
			<option value="Wheat">Wheat</option>
			<option value="Fish">Fish</option>

		</select>

	</div>

	<div class="form-group">
		<label>Cuisine</label> <select name="cusisne">
			<option value="General">General</option>
			<option value="Arabic">Arabic</option>
			<option value="Indian">Indian</option>
			<option value="Chinese">Chinese</option>
			<option value="Italian">Italian</option>
			<option value="Greek">Greek</option>
			<option value="Japanese">Japanese</option>
		</select>

	</div>



	<div class="form-group">
		<label>Type</label> <select name="type">
			<option value="soup">Soup</option>
			<option value="appetizer">Appetizer</option>
			<option value="salad">Salad</option>
			<option value="main course">Main Course</option>
			<option value="dessert">Dessert</option>
		</select>

	</div>


	<div class="form-group">
	
		<label>duration </label> 
				<input type="number" step=".25" class="form-control">
				<select>
			<option value="Hours">Hours</option>
			<option value="Minutes">Minutes</option>	
		</select>
			<input type="hidden" name="duration" >		
	</div>
	<div class="form-group">
		<label>Servings </label> <input type="number" name="servings"
			class="form-control">
	</div>
		<div class="form-group">
		<label>Calories </label> <input type="number" name="calories"
			class="form-control">
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>