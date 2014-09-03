(function($) {
	
	$.fn.interactive_form = function(options) {
		
		// Allow custom options 
		var opts = $.extend( {}, $.fn.interactive_form.defaults, options);
		
		return this.each(function() {
			
			// Get all hidden selects
			var hidden_selects = $(this).find(opts.hidden_select_input_selector);
			
			// Things to do for all hidden selects
			hidden_selects.each(function() {
				
				$.fn.display_selected_value = function() {
					
					// Find the parent container to the hidden select
					var parent = $(this).parents(opts.hidden_select_input_parent_selector);

					// Get the element that will display the selected value
					var display = parent.find(opts.hidden_select_input_parent_value_selector);

					// Get the currently selected option
					var selected_text = $(this).children(':selected').text();

					// Put the currently selected option in the display
					display.html(selected_text);					
					
				}
				
				$(this).display_selected_value();
								
				$(this).on('change', function() {
				
					$(this).display_selected_value();
					
				});
				
			});
			
			
		});
		
	}
	
} (jQuery));

// Default settings
$.fn.interactive_form.defaults = {
	hidden_select_input_selector: '.hidden-select', // The element that acts as a hidden select 
	hidden_select_input_parent_selector: '.hidden-select-cover', // The containing element for the hidden select
	hidden_select_input_parent_value_selector: '.value' // The element that will display the selected value for a hidden select. This element should be a descendant to the parent
};