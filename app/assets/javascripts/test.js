$('document').ready(function() {
	$('#z').datepicker({
    inline: true,
    altField: '#d'
	});

	$('#d').change(function(){
    $('#z').datepicker('setDate', $(this).val());
	});
})
