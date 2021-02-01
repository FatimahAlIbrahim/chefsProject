<jsp:include page="../shared/layout.jsp" />

<form id="editRecipe" action="${appName}recipe/edit" method="post">

	<img id="recipeImg" src="http://via.placeholder.com/500x250" width="500" height="250">
	<div class="form-group">
		<label>Picture </label> <input id="pictureUrl" type="text" name="picture"
			class="form-control" required>
	</div>
	
	<div class="form-group">
		<label>Name </label> <input type="text" name="name"
			class="form-control" required>
	</div>
	
	<div class="form-group">
		<label>Description </label> <input type="text" name="description"
			class="form-control" required>
	</div>
	
	<div id="ingContainer"></div>
	<div class="form-group">
		<label>Ingredients </label>
	</div>
	<div class="form-group">
		<label>amount </label> <label>measurement</label> <label>item</label>
	</div>
	<div class="form-group">
		<input id="amount" type="number" step=".25" class="form-control">
		<select id="measurement">
			<option value="--">--</option>
			<option value="cup">cup</option>
			<option value="tsp">tsp</option>
			<option value="tbsp">tbsp</option>
			<option value="gram">gram</option>
			<option value="mL">mL</option>
		</select> <input id="item" type="text" class="form-control">
		<button type="button" id="addIng">add ingredient</button>
	</div>
	<input id="ingredients" type="hidden" name="ingredients">
	
	<div class="form-group">
		<label>Allergy Warnings</label> 
		<select name="allergyWarnings"
			multiple="multiple" required>
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
	
	<div id="instructionsCon">
	
	</div>
	
	<div class="form-group">
		<label>Instructions </label> 
		<input id="instructionsText" type="text" class="form-control">
		<button type="button" id="addIns">add ingredient</button>
		<input id="instructions" type="hidden" name="instructions">
	</div>
	
	<div class="form-group">
		<label>Cuisine</label> 
		<select name="cuisine">
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
		<label>Type</label> 
		<select name="type">
			<option value="soup">Soup</option>
			<option value="appetizer">Appetizer</option>
			<option value="salad">Salad</option>
			<option value="main course">Main Course</option>
			<option value="dessert">Dessert</option>
		</select>
	</div>
	
	<div class="form-group">
		<label>duration </label> <input id="durationNumber" type="number" step=".25" class="form-control" required> 
		<select
			id="durationType">
			<option value="Hours">Hours</option>
			<option value="Minutes">Minutes</option>
		</select> <input id="duration" type="hidden" name="duration">
	</div>
	
	<div class="form-group">
		<label>Servings </label> <input type="number" name="servings"
			class="form-control" required>
	</div>
	
	<div class="form-group">
		<label>Calories </label> <input type="number" name="calories" class="form-control" required>
	</div>
	
	<input type="hidden" name="user" value="${userId}" >
	
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<button id="submit" type="submit" class="btn btn-primary">Submit</button>