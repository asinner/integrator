var forms_ready = function() {
	
	$('body').on('focus', '.date-input', function() {
		$(this).datepicker({
			dateFormat: 'yy/mm/dd'
		});
	});
	
}
$(document).on('ready', forms_ready);
$(document).on('page:load', forms_ready);