function hidemessage(div){
	setTimeout(function(){
		$(div).find('div').fadeOut();
	}, 3000);
}

function showCoords(c){
	$('#x').val(c.x);
	$('#y').val(c.y);
	$('#w').val(c.w);
	$('#h').val(c.h);
}