(function($) {
	
	// nice_form plugin function
	$.fn.nested_form = function(options) {
		
		// Allow custom options 
		var opts = $.extend( {}, $.fn.nested_form.defaults, options);
		
		return this.each(function() {
			
			// Are certain sections of the form supposed to by filled in object_by_object?
			if (opts.object_by_object) {
				
				// Things to do when an object gets disabled
				$(opts.object_selector).on('disable', function() {
					
					// Is the object not currently disabled?
					if (!$(this).hasClass('disabled')) {
					
						//..add a disabled class to the object
						$(this).addClass('disabled');

						//..disable all inputs underneath the object
						$(this).find('input').prop('disabled', true);
						
					}
					
				});
				
				// Things to do when an object gets enabled
				$(opts.object_selector).on('enable', function() {
					
					// Is the object currently disabled?
					if ($(this).hasClass('disabled')) {
						
						//..then remove the disabled class
						$(this).removeClass('disabled');
						
						//..and enable all inputs
						$(this).find('input').prop('disabled', false);
						
					}
					
				});
				
				
				//..then get each section that needs to be filled in object-by-object
				var sections = $(this).find(opts.object_by_object_selector);
				
				// For each of these sections, automatically disable every input underneath
				// every object that comes after the first object
				$.each(sections, function() {
					
					// get all the objects but the first
					var objects = $(this).find(opts.object_selector);
					
					// disable all objects after the first object
					objects.not(':first').trigger('disable');
					
					// get all inputs under all objects
					var inputs = objects.find('input');
					
					// Things to do whenever an input under an object is typed into
					inputs.on('keyup', function() {
						
						// Get the current object
						var object = $(this).parents(opts.object_selector);
						
						// Get all required inputs underneath the current object
						var required_inputs = object.find(opts.object_required_input_selector);
												
						// This makes an array out of all inputs that are blank. If 
						// the size of that array is 0 (meaning all required inputs are present) 
						// then enable the next object.
						if (required_inputs.filter(function() { return $(this).blank() }).length == 0) {
							
							// Enable the next object
							object.next(opts.object_selector).trigger('enable');
														
						} else {
							
							// Ensure the next object is disabled
							object.next(opts.object_selector).trigger('disable');
							
						}

						
					});
					
				});
				
				
			}
						
		});
			
	}
	
} (jQuery));

// Default settings
$.fn.nested_form.defaults = {
	object_by_object: true,
	object_by_object_selector: '.object-by-object',
	object_selector: '.object',
	object_required_input_selector: '.required'
};