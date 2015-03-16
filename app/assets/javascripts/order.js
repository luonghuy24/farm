$('document').ready(function() {
	$(document).on('click', '.save-order', function(){
		var order_id = this.id
		$.ajax ({
			type: "POST",
			url: "/orders/"+order_id+"/save",
			data: {id: order_id}
		});
     location.replace('/products');
	});
});


