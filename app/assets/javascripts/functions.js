function modal(view) {
	// Create the modal background
	var container = modalBackground();
	
	// Hide the container and append the view
	container.hide().append(view.hide());
	
	// Fade in the the modal
	container.fadeIn(200, function() {
		view.show('fade', { direction: 'up' }, 200);
	});

	
	// Prepare any forms that were in the view
	view.prepareForms();
	
	// Whenever the modal background is removed, push the pre modal url into history
	$('#modal-background').on('remove', function() {
		preModalPushState();
	});
}
function removeModalBackground() {
	
	$('#modal-background').fadeOut(200, function() {
		$(this).remove();
	});
	
}
function modalBackground() {
	if ($('#modal-background').length) {
		
		removeModalBackground();
		
	} else {
		// Create the background element
		var bg = $("<div id='modal-background'></div>");
		// Append the element to the html
		$('body').append(bg);
		
		$(document).mouseup(function (e)
		{
		    var container = $(".form-wrap, .ui-datepicker");

		    if (!container.is(e.target) // if the target of the click isn't the container...
		        && container.has(e.target).length === 0) // ... nor a descendant of the container
		    {
				removeModalBackground();
		    }
		});
	}
	return bg;
}
function ensureDashboardContainersExist(partial) {
	if ($('#dashboard').length == 0) {
		$('#page').view(partial);
	}
}
// Appends the given record to the given container
function newRecord(record, container) {
	// First remove the no results
	$('.no-results').remove();
	// Append the record to the container
	$(container).append(record);
}
// Replace old record with new record
function replaceRecord(newRecord, oldRecord) {
	oldRecord.replaceWith(newRecord);
}

$.fn.view = function(view) {
	$(this).empty().html(view);
	$(this).enableDynamicInterface();
}
$.fn.dashboardView = function(view, partial) {
	ensureDashboardContainersExist(partial);
	$(this).view(view);
}
$.fn.enableDynamicInterface = function() {
	//$(this).enableSortable();
}
$.fn.enableSortable = function() {
	$('.sortable').sortable();
}

$.fn.prepareForms = function() {
	$(this).prepareHiddenSelects();
}
$.fn.prepareHiddenSelects = function() {
	// Get all of the hidden selects
	var inputs = $(this).find('.hidden-select');
	
	// Put the selecte value into the appropriate container
	inputs.each(function() {
				
		$(this).displayHiddenSelectValue();
		
		// Make sure the selected value container gets updated whenever a select changes
		$(this).on('change', function() {
			$(this).displayHiddenSelectValue();
		});
	});
}
$.fn.displayHiddenSelectValue = function() {
	// Displaying the value
	var val = $(this).find('option:selected').text();
	$(this).parents('.select-cover').find('.value').html(val);
}

