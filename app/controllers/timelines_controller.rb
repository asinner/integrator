class TimelinesController < ApplicationController
  layout :resolve_layout
  
  def index
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @timelines = @event.timelines
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    @timeline = Timeline.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @timeline = @event.timelines.new(timeline_params)
    respond_to do |format|
      if @timeline.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def edit
    @timeline = Timeline.find(params[:id])
    @event = @timeline.event
    authorize @event, :find
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def update
    @timeline = Timeline.find(params[:id])
    @event = @timeline.event
    authorize @event, :find
    respond_to do |format|
      if @timeline.update_attributes(timeline_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def timeline_params
    params.require(:timeline).permit(:name)
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
