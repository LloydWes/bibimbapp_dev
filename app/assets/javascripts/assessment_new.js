//
//= require_self 
// 

$(function(){
	$('input[type~="radio"]').css('visibility', 'hidden');

	$('a[class~="list-group-item-action"]').css('cursor', 'pointer');

	$('input[type="radio"]').each(function(index, value){
		if($(this).prop('checked')){
			$(this).parent().toggleClass('active');
		}
	});
	$('a[class~="list-group-item-action"]').click(function(e){
		console.log(this);
		let question_id = $('input[type="radio"]', this).attr('name');
		console.log(question_id);
		$(`a[class~="active"] input[name=${question_id}]`).parent().toggleClass('active');
		$(this).toggleClass('active');
		$('a[class~="active"] input').prop('checked', true);
	});
});