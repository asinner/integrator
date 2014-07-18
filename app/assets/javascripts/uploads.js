var uploads_ready = function() {
	// Whenever the upload form is submitted, put a loading gif into the
	// iframe
	$('body').on('submit', '#new_upload', function() {
		$('#iframe-upload').on('load', function() {
			$('#new_upload').finished();
		});
	});
	
}
$(document).on('ready', uploads_ready);
$(document).on('page:load', uploads_ready);