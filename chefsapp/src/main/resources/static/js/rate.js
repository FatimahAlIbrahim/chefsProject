var list = ['1', '2', '3', '4', '5'];
list.forEach(rate);

 function rate (element) {
	document.getElementById(element).addEventListener("click", clickStar);
}

function clickStar() {
		var starClass = document.getElementById(element).className;
	

		if (starClass.includes("unchecked")) {
			Number(element);
			//for(let i=element ; i>0 ; i--){
				document.getElementById(element).classList.remove("unchecked");
			document.getElementById(element).classList.add("checked");
			//}

		}
		else {
			document.getElementById(element).classList.remove("checked");
			document.getElementById(element).classList.add("unchecked");
		}

	}
document.getElementById("buttonnew").addEventListener("click", function() {
	alert("Work in progress");
});