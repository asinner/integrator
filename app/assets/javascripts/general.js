var general_ready = function() {
	$('body').on('click', '.togglable', function() {
		var parent = $(this).parents('[data-toggle-parent]');
		parent.find(parent.attr('data-toggle-target')).toggle('blind', 200);
	});
}
$(document).on('ready', general_ready);
$(document).on('page:load', general_ready);