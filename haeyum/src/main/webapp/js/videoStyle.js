var angle = 0;
function galleryspin(sign) {
	spinner = document.querySelector("#spinner");
	if (!sign) {
		angle = angle + 60;
	} else {
		angle = angle - 60;
	}
	spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle
			+ "deg); -moz-transform: rotateY(" + angle
			+ "deg); transform: rotateY(" + angle + "deg);");
}

$(document).ready(function(){
	var offset, spot,
	cnt = 150;
	isRight = false;
	isLeft = false;
	$("#container").on("mousedown", function(event){
		offset = $(this).offset();
		spot =  event.pageX - offset.left;
		isRight = false;
		isLeft = false;
	}).on("mousemove", function(event){
		if (event.buttons == 1 ) {
			if (spot + cnt < event.pageX - offset.left) {
				console.log("우");
				isRight = true;
				//$("#spinR").click();
			} else if (spot - cnt > event.pageX - offset.left) {
				console.log("좌");
				isLeft = true;
				//$("#spinL").click();
			}
	
		} 
	}).on("mouseup", function(){
		if (isLeft == true) {
			$("#spinL").click();	
		} else if (isRight == true) {
			$("#spinR").click();	
		}
		
	});
});
