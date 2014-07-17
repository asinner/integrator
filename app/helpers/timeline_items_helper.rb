module TimelineItemsHelper
  def timeline_friendly start_time, end_time
    "#{start_time.strftime("%l:%M")} -#{end_time.strftime("%l:%M %p")}"
  end
end
