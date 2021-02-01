$(document).ready(function() {
	
	if($(location).attr("href").endsWith("/")){
		$(logo).attr("src", "images/chef.png");
	}
	else{
		$(logo).attr("src", "../images/chef.png");
	}

	$("#addIng").on("click", function() {
		var amount = $("#amount").val();
		var measurement = $("#measurement").children("option:selected").val();
		var item = $("#item").val();

		if (amount != "" && item != "") {
			if (measurement != "--")
				var ingredient = amount + " " + measurement + " of " + item;
			else
				var ingredient = amount + " " + item;
			$("#ingContainer").append("<div class='ingItem'><p class='ingText' style='display: inline;'>" + ingredient + "</p><span class='deleteIng' style='display:  none; text-align: right; float: right;'> delete</span></div>");
		}
		else {
			alert("please enter amount and item");
		}
	});

	$("#ingContainer").on("mouseenter", ".ingItem", function() {
		$(this).children(".deleteIng").css("display", "inline");
		$(this).css({"background-color": "#DECFB5", "color": "white"});
	});

	$("#ingContainer").on("mouseleave", ".ingItem", function() {
		$(this).children(".deleteIng").css("display", "none");
		$(this).css({"background-color": "#FEF6E8", "color": "black"});
	});

	$("#ingContainer").on("click", ".deleteIng", function() {
		$(this).parent().remove();
	});

	$("#addIns").on("click", function() {
		var step = $("#instructionsText").val();

		if (step != "") {
			$("#instructionsCon").append("<div class='insItem'><p class='insText' style='display: inline;'>" + step + "</p><span class='deleteIns' style='display:  none; text-align: right; float: right;'> delete</span></div>");
		}
		else {
			alert("please enter an instruction");
		}
	});

	$("#instructionsCon").on("mouseenter", ".insItem", function() {
		$(this).children(".deleteIns").css("display", "inline");
		$(this).css({"background-color": "#DECFB5", "color": "white"});
	});

	$("#instructionsCon").on("mouseleave", ".insItem", function() {
		$(this).children(".deleteIns").css("display", "none");
		$(this).css({"background-color": "#FEF6E8", "color": "black"});
	});

	$("#instructionsCon").on("click", ".deleteIns", function() {
		$(this).parent().remove();
	});

	function inputValidation(event) {
		if (!$.trim($('#ingContainer').html()).length) {
			event.preventDefault();
			alert("please add at least 1 step and 1 ingredient");
		}
		else {
			var ingredients = "";
			$(".ingItem").each(function() {
				ingredients += $(this).children(".ingText").text() + ", ";
			});

			var instructions = "";
			$(".insItem").each(function() {
				instructions += $(this).children(".insText").text() + ", ";
			});

			ingredients = ingredients.substring(0, ingredients.length - 2);
			instructions = instructions.substring(0, instructions.length - 2);
			$("#ingredients").val(ingredients);
			$("#instructions").val(instructions);
			var duration = $(durationNumber).val() + " " + $("#durationType").children("option:selected").val();
			$("#duration").val(duration);
		}
	}

	$("#addRecipe").submit(inputValidation);

	$("#editInfo").on('click', function() {
		$("#userInfo").css("display", "none");
		$("#editUser").css("display", "block");
	});

	$("#shareUserButton").on('click', function() {
		console.log("clicked")
		$("#shareUserDiv").css("display", "block");
	});

	$("#pictureUrl").on('change', function() {
		var newUrl = $(this).val();
		$("#recipeImg").attr("src", newUrl);
	});


});