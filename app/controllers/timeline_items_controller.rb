class TimelineItemsController < ApplicationController
    
  layout :resolve_layout

  def index
    @timeline_category = TimelineCategory.find(params[:timeline_category_id])
    @timeline = @timeline_category.timeline
    @event = @timeline.event
    authorize @event, :find
    
    @timeline_items = @timeline_category.timeline_items.order(start_time: :asc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @timeline_category = TimelineCategory.find(params[:timeline_category_id])
    @timeline = @timeline_category.timeline
    @event = @timeline.event
    authorize @event, :find
    @timeline_item = TimelineItem.new
    @timeline_item.build_note
    
    respond_to do |format|
      format.html { @timeline_categories = @timeline.timeline_categories }
      format.js
    end
  end
  
  def create
    @timeline_category = TimelineCategory.find(params[:timeline_category_id])
    @timeline = @timeline_category.timeline
    @event = @timeline.event
    authorize @event, :find
    @timeline_item = @timeline_category.timeline_items.new(timeline_item_params)
    authorize @timeline_item.vendor, :find if @timeline_item.vendor
    
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
  
  def edit
    @timeline_item = TimelineItem.find(params[:id])
    @timeline = @timeline_item.timeline
    @event = @timeline.event
    authorize @event, :find
    
    respond_to do |format|
      format.html { @timeline_categories = @timeline.timeline_categories }
      format.js
    end
  end
  
  def update
    @timeline_item = TimelineItem.find(params[:id])
    @timeline = @timeline_item.timeline
    @event = @timeline.event
    authorize @event, :find
    respond_to do |format|
      if @timeline_item.update_attributes(timeline_item_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def timeline_item_params
    params.require(:timeline_item).permit(:description, :start_time, :end_time, :st_date, :st_hour, :st_min, :st_period, :et_date, :et_hour, :et_min, :et_period, :vendor_id, note_attributes: [ :message ])
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
