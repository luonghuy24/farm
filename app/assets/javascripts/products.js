// data = {user, product}
$('document').ready(function() {
	var user_email = $('.current-user-email').html();

	$('.favorite_product_unliked').click(function(){
		var product_id = this.id;
		$.ajax({
			type: "POST",
			url: "favorites",
			data: { user_email: user_email, product_id: product_id }
		});
		$(this).hide();
		$('.' + product_id + '.favorite_product_liked').show();
	});

	$('.favorite_product_liked').click(function(){
		var product_id = this.id;
		var favorite_id = $(this).data('value')
		var url = "/favorites/" + $(this).data('value')
		$.ajax({
			type: "DELETE",
			url: url,
			data: { id: favorite_id }
		});
		$(this).hide();
		$('.' + product_id + '.favorite_product_unliked').show();
	});


	// -------------------------------------
	$('.like-un-logged-in').click(function(){
		alert('Please login to like this product');
	})
});
