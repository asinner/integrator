(function($) {
	
	$.fn.display_errors = function(options) {			
				
		var form = $(this);
		
		// Get an input specified by the name in args
		$.fn.get_input = function(args) {
			
			return form.find('input[name="' + options.object + '[' + args.name +']' +'"]');
			
		}
		
		// Display an error for an input
		$.fn.display_error = function(args) {
			
			var error = $("<span class='error msg'></span>");
			error.html(args.msg);
			$(this).after(error);
			
		}
			
		// Removes all errors within the form
		$.fn.remove_errors = function() {
			
			form.find('.error.msg').remove();
			
		}
		
		// Wipe all errors before displaying them
		$(this).remove_errors();
		
		// Were errors explicity passed to this function?
		if (options.errors) {
			
			//..then loop through the errors
			$.each(options.errors, function(key, value) {
			
				var input = $(this).get_input({
					name: key
				});
				
				input.display_error({
					msg: value[0]
				});
				
			});
			
		}		
				
		return this;
		
	}
	
} (jQuery));
