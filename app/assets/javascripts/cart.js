$('document').ready(function() {
	$(document).on('change', '.edit-item-product-quantity', function(){

		var product_id = this.id;
		var item_id = $("#"+product_id).data("value")
		var quantity = $(this).val();
		var price = $('#'+product_id+'.edit-item-product-price').data("value");
		var cost = price*quantity;
		var total_cost = $('#total-cost').html() - $("#"+product_id+'.edit-item-product-cost').val() + cost
		$("#"+product_id+'.edit-item-product-cost').val(cost);
		$("#total-cost").html(total_cost)
		$.ajax ({
			type: "PUT",
			url: "/items/" + item_id,
			data: {quantity: quantity, cost: cost}
		});
	});
});


