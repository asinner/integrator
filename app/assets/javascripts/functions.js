function modal(view) {
	// Create the modal background
	var container = modalBackground();
	container.append(view);
	// Prepare any forms that were in the view
	//view.prepareForms();
	
	// Whenever the modal background is removed, push the pre modal url into history
	$('#modal-background').on('remove', function() {
		preModalPushState();
	});
}
function modalBackground() {
	if ($('#modal-background').length) {
		
		$('#modal-background').remove();
		
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
		        bg.remove();
		    }
		});
	}
	return bg;
}
// Appends the given record to the given container
function newRecord(record, container) {
	// First remove the no results
	$('.no-results').remove();
	// Append the record to the container
	$(container).append(record);
}