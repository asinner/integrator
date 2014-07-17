var forms_ready = function() {
	
	$('body').on('focus', '.date-input', function() {
		$(this).datepicker({
			dateFormat: 'yy/mm/dd',
			nextText: '›',
			prevText: '‹'
		});
	});
	
	$('body').on('click', '.close, .cancel-button', function() {
		modalBackground();
	});
	
	$('body').on('click', '.file-input-button', function() {
		$(this).parents('.body').find('.hidden-file-input').click();
	});
	
	$('body').on('change', '.trigger-submission-change', function() {
		$(this).parents('form').submit();
	});
	
}
$(document).on('ready', forms_ready);
$(document).on('page:load', forms_ready);