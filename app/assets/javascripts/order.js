$(document).on('click', '.back-to-edit-cart', function(){
	var order_id = this.id
	var user_id = document.querySelector('.current-user-email').id

	$.ajax ({
		type: "POST",
		url: "/orders/"+order_id+"/back_to_edit_cart",
		data: {id: order_id}
	});
});


