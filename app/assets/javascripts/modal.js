(function($) {
	
	$.fn.modal = function(options) {
		
		// Override default options with any passed options
		var opts = $.extend( {}, $.fn.modal.defaults, options);
		
		$.fn.get_modal_container = function() {
			
			var container = $(this).find('#' + opts.modal_id);
			
			return container;
			
		}
		
		$.fn.has_modal_container = function() {
			
			return $(this).find('#' + opts.modal_id).length;
			
		}
		
		$.fn.create_modal_container = function() {
			
			// Create the container
			var container = $("<div id='" + opts.modal_id + "'></div>");
			
			// Create the close symbol
			var close_icon = $("<div class='close'>&#10005;</div>");
			
			// Put the close icon into the container
			container.append(close_icon);
			
			// Append the container
			$(this).append(container);

			container.on('click', function(e) {
			
				if ($(this).is(e.target)) {
					$('body').modal({
						action: 'close'
					});
				}
				
			});
			
			close_icon.on('click', function() {
				
				$('body').modal({
					action: 'close'
				});
				
			});
			
		}
		
		$.fn.close = function() {
		
			var container = $(this).get_modal_container();
			
			container.remove();
			
		}
		
		$.fn.open = function(options) {
			
			// Does the modal container not exist?
			if (!$(this).has_modal_container()) {
				
				//..then create it
				$(this).create_modal_container();
								
			}
			
			// Get the modal container
			var container = $(this).get_modal_container();
			
			// Add the view to it
			container.append(options.view);
			
			
		}
		
		if (options.action == 'open') {
			
			$(this).open({
				view: opts.view
			});
						
		} else if (options.action == 'close') {
			
			$(this).close();
			
		}
		
	}
	
} (jQuery));

// Default settings
$.fn.modal.defaults = {
	modal_id: 'modal-background'
};
