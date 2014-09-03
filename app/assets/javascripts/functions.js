$.fn.blank = function() {
	
	if ($.trim($(this).val()) == '') {
		
		return true;
		
	} else {
		
		return false;
		
	}
}
$.fn.present = function() {
	
	// Is the input not blank?
	if (!$(this).blank()) {
		
		// ..then it is present
		return true;
		
	} else {
		
		// ..then it is not present
		return false;
		
	}
}
function modal(view) {
	
	// Create the modal background
	var container = modalBackground();
	
	// Hide the container and append the view
	container.hide().append(view.hide());
	
	// Fade in the the modal
	container.fadeIn(200, function() {
		view.show('fade', { direction: 'up' }, 200);
	});		
	
	// Trigger the loaded event for view and all parents
	view.trigger('loaded');
		
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
		    var container = $(".form-wrap, .ui-datepicker, .modal");

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
