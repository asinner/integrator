class TimelineItemsController < ApplicationController
    
  layout :resolve_layout

  def index
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.event
    authorize @event, :find
    @timeline_items = @timeline.timeline_items.order(start_time: :asc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.event
    authorize @event, :find
    @timeline_item = TimelineItem.new
    @contacts = @event.contacts
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.event
    authorize @event, :find
    @timeline_item = @timeline.timeline_items.new(timeline_item_params)
    respond_to do |format|
      if @timeline_item.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def timeline_item_params
    params.require(:timeline_item).permit(:description, :start_time, :end_time, :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period)
  end
  
  def resolve_layout
    case action_name
    when 'index'
      'event_overview'
    else
      'application'
    end
  end
end
