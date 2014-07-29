class TimelineCategoriesController < ApplicationController
  
  layout :resolve_layout
  
  def index
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.event
    authorize @event, :find
    @timeline_categories = @timeline.timeline_categories
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @timeline = Timeline.find(params[:timeline_id])
    @timeline_category = TimelineCategory.new
    @event = @timeline.event
    authorize @event, :find
    
    respond_to do |format|
      format.html { @timeline_categories = @timeline.timeline_categories }
      format.js
    end
  end
  
  def create
    @timeline = Timeline.find(params[:timeline_id])
    @timeline_category = @timeline.timeline_categories.new(timeline_category_params)
    @event = @timeline.event
    authorize @event, :find
    respond_to do |format|
      if @timeline_category.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def timeline_category_params
    params.require(:timeline_category).permit(:description)
  end
  
  def resolve_layout
    case action_name
    when 'index'
      'event_overview'
    when 'new', 'edit'
      'event_overview_modal'
    else
      'application'
    end
  end
end
