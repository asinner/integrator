function clearFlash() {
	$('div.flash').remove();
}

function setPreModalUrl(url) {
	$('html').attr('data-pre-modal', url);
} 
function preModalPushState() {
	var href = $('html').data('pre-modal');
	if (history && history.pushState && href) {
		history.pushState(null, document.title, href);
		removePreModalPushStateUrl();
	}
	function removePreModalPushStateUrl() {
		$('html').removeAttr('data-pre-modal');
	}
}
var push_state_ready = function() {

	// Anytime a link is clicked that will display in modal
	// set the href to return to
	$('body').on('click', '.modal-link', function() {
		var preModalUrl = window.location.href
		setPreModalUrl(preModalUrl);
	});
		
	// Check support for push state
	if (history && history.pushState) {
		
		// Get the script for the link and push the href into the history
		// Note this will not fire on delete links
		$('body').on('click', 'a:not([data-method="delete"])', function() {
			clearFlash();
			$.getScript(this.href);
			history.pushState(null, document.title, this.href);
			return false; // Prevents the link from making its normal request
		});
		
		// Anytime a delete button is clicked then push into History the pre modal url
		$('body').on('click', 'a[data-method="delete"]', function() {
			preModalPushState();
		});
		
		// When the back button is pressed
		$(window).bind('popstate', function() {
			$.getScript(location.href);
		});
	}

}
$(document).on('ready', push_state_ready);
$(document).on('page:load', push_state_ready);