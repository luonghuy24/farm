$('document').ready(function() {
	$(document).on('click', '.favorite_product_unliked', function(){
		var user_id = document.querySelector('.current-user-email').id
		var product_id = this.id;
		$.ajax({
			type: "POST",
			url: "/favorites",
			data: { user_id: user_id, product_id: product_id }
		});
		$(this).hide();
		$('.' + product_id + '.favorite_product_liked').show();
	});

	$(document).on('click', '.favorite_product_liked', function(){
		var user_id = document.querySelector('.current-user-email').id
		var product_id = this.id;
		var favorite_id = $(this).data('value')
		var url = "/favorites/" + $(this).data('value')
		$.ajax({
			type: "DELETE",
			url: url,
			data: { product_id: product_id }
		});
		$(this).hide();
		$('.' + product_id + '.favorite_product_unliked').show();
	});

	// -------------------------------------
	$('.un-logged-in').click(function(){
		alert('Please login to like this product');
	});


	$('.modal-product-quantity').change(function(){
		var product_id = this.id;
		var quantity = $(this).val();
		var price = $('#'+product_id+'.modal-product-price').data("value");
		var cost = price*quantity;
		$("#"+product_id+'.modal-product-cost').val(cost);
		// $("#"+product_id+'.modal-product-cost').html(cost);
	});

	$('.add_to_cart').click(function(){
		var product_id = this.id;
		var user_id = document.querySelector('.current-user-email').id
		var quantity = $('#'+product_id+'.modal-product-quantity').val()
		var price = $('#'+product_id+'.modal-product-price').data("value");
		var cost = quantity*price
		$.ajax({
			type: "POST",
			url: "/users/"+user_id+"/carts",
			data: { user_id: user_id, product_id: product_id, quantity: quantity, cost: cost }
		});
		$(this).hide();
		$("#"+product_id+'.add-to-cart').hide();
		$("#"+product_id+".in-your-cart").show();
	});

	$(".add-to-cart").click(function(){
		var product_id = this.id
		$("#add-to-cart-modal-box"+"_"+product_id).modal('show');
	});

	$(".delete_item").click(function(){
		var item_id = this.id
		$.ajax({
			type: "DELETE",
			url: "/items/"+item_id,
			data: {item_id: item_id}
		})
    document.location.reload();
		var total_cost = $('#total-cost').html() - $("#"+product_id+'.edit-item-product-cost').val();
		$("#total-cost").html(total_cost);
	})
	// $(".favorite_product_unliked").on("click", function(event) {
 //  	console.log("link clicked");
	// });
});