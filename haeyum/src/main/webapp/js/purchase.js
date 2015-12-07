	$('#show').avgrund({
		height: 200,
		holderClass: 'custom',
		showClose: true,
		showCloseText: 'Close',
		enableStackAnimation: true,
		template: '<p>결제 하시겠습니까?</p>' +
		'<div>' +
		'<a href="#" id = "buyStore" class="twitter avgrund-close">예</a>' +
		'<a href="#" class="dribble avgrund-close">아니요</a>' +				
		'</div>'
	});

