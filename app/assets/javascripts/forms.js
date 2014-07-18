$.fn.getType = function() {
	return $(this)[0].nodeName.toLowerCase();
}
$.fn.disable = function() {
	// Get the type of element this method was called on
	var type = $(this).getType();
	
	if (type == 'button' || type == 'input') {
		$(this).prop('disabled', true).addClass('disabled');
	} else {
		$(this).find("input[type='submit']").prop('disabled', true).addClass('disabled');
	}
}
$.fn.enable = function() {
	// Get the type of element this method was called on
	var type = $(this).getType();

	if (type == 'button' || type == 'input') {
		$(this).prop('disabled', false).removeClass('disabled');
	} else {
		$(this).find("input[type='submit']").prop('disabled', false).removeClass('disabled');
	}
}
$.fn.removeErrors = function() {
	// Get the type of element
	var type = $(this).getType();
	
	if (type == 'input') {
		// Get the parent field
		var field = $(this).parents('.field');
		// Remove the error class from the field
		field.removeClass('error');
		// Remove the error message from the field
		field.find('.error-placeholder').html('');
		
	} else if (type == 'div' && $(this).hasClass('field')) {
		// Remove the error class from the field
		$(this).removeClass('error');
		// Remove the error message from the field
		$(this).find('error-placeholder').html('');
	} else if (type == 'form') {
		// Remove all error classes
		$(this).find('.error').removeClass('error');
		// Remove all error messages
		$(this).find('.error-placeholder').html('');
	}
}
$.fn.submitted = function() {
	$(this).disable();
	$(this).removeErrors();
}
$.fn.processing = function(type) {
	$.fn.showSpinner = function() {
		var type = $(this)[0].nodeName.toLowerCase();
		if (type == 'form') {
			var opts = {
			  lines: 13, // The number of lines to draw
			  length: 5, // The length of each line
			  width: 2, // The line thickness
			  radius: 5, // The radius of the inner circle
			  corners: 0.5, // Corner roundness (0..1)
			  rotate: 0, // The rotation offset
			  direction: 1, // 1: clockwise, -1: counterclockwise
			  color: 'rgb(100, 100, 100)', // #rgb or #rrggbb or array of colors
			  speed: 1.9, // Rounds per second
			  trail: 60, // Afterglow percentage
			  shadow: false, // Whether to render a shadow
			  hwaccel: false, // Whether to use hardware acceleration
			  className: 'spinner', // The CSS class to assign to the spinner
			  zIndex: 2e9, // The z-index (defaults to 2000000000)
			  top: '25px', // Top position relative to parent
			  left: '25px' // Left position relative to parent
			};
			var target = $(this).find('.footer')[0];
			var spinner = new Spinner(opts).spin(target);
		}
	}
	$(this).showSpinner();
}
$.fn.finished = function() {
	// Get the type of element this method was called on
	var type = $(this).getType();
	if (type == 'form') {
		$(this).enable();
	}
	$(this).find('.spinner').remove();
}


var forms_ready = function() {
	
	// Whenever a form gets submitted, disable the prop button
	$('body').on('submit', 'form', function() {
		$(this).submitted();
		$(this).processing();
	});
	
	
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