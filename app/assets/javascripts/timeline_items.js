function sortTimelineItems() {
	
	$('.timeline_item').sort(function(a, b) {
		return new Date($(a).attr("data-start-time")) > new Date($(b).attr("data-start-time"));
	}).each(function() {
		$('.timeline_items.loop').append(this);
	});
}