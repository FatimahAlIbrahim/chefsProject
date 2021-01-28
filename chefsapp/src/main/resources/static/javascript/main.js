$(document).ready(function() {

	$("#addIng").on("click", function() {
		var amount = $("#amount").val();
		var measurement = $("#measurement").children("option:selected").val();
		var item = $("#item").val();

		if (amount != "" && item != "") {
			if (measurement != "--")
				var ingredient = amount + " " + measurement + " of " + item;
			else
				var ingredient = amount + " " + item;
			$("#ingContainer").append("<div class='ingItem'><p class='ingText' style='display: inline;'>" + ingredient + "</p><span class='deleteIng' style='display:  none;'> delete</span></div>");
		}
		else {
			alert("please enter amount and item");
		}
	});

	$("#ingContainer").on("mouseenter", ".ingItem", function() {
		$(this).children(".deleteIng").css("display", "inline");
	});

	$("#ingContainer").on("mouseleave", ".ingItem", function() {
		$(this).children(".deleteIng").css("display", "none");
	});

	$("#ingContainer").on("click", ".deleteIng", function() {
		$(this).parent().remove();
	});

	function inputValidation(event) {
		if (!$.trim($('#ingContainer').html()).length) {
			event.preventDefault();
			alert("please add at least 1 ingredient");
		}
		else {
			var ingredients = "";
			$(".ingItem").each(function() {
				ingredients += $(this).children(".ingText").text() + ", ";
			});
			ingredients = ingredients.substring(0, ingredients.length - 2);
			$("#ingredients").val(ingredients);
			var duration = $(durationNumber).val() + " " + $("#durationType").children("option:selected").val();
			$("#duration").val(duration);
		}
	}
	
	$("#addRecipe").submit(inputValidation);

});