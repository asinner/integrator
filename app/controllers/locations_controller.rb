class LocationsController < ApplicationController
  
  layout :resolve_layout
  
  def index
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @locations = @event.locations
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    # Build parent object
    @event = Event.find(params[:event_id])
    
    # Object for the normal view
    @location = Location.new
    @location.build_address
    
    if params[:workflow]
      
      # Sets the workflow variable if the request was made with it
      @workflow = true if params[:workflow]
      
      # Build children for workflow view
      2.times { @event.locations.new }
      
      # Build grand-children
      @event.locations.each { |location| location.build_address }
      
    end    
    respond_to do |format|
      format.html { @locations = @event.locations }
      format.js
    end
  end
  
  def create
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @location = @event.locations.new(location_params)
    @address = @location.address
    respond_to do |format|
      if @location.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def edit
    @location = Location.find(params[:id])
    @event = @location.event
    authorize @event, :find
    respond_to do |format|
      format.html { @locations = @event.locations }
      format.js
    end
  end
  
  def update
    @location = Location.find(params[:id])
    @event = @location.event
    authorize @event, :find
    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def search
    
    @locations = Location.where('name like ?', "%#{params[:name]}%").limit(5).order(name: :asc)
    
    respond_to do |format|
      format.html
      format.json { render json: @locations, only: :name, include: { address: { only: [ :line1, :line2, :city, :state, :zip ] } } }
    end
    
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
  
  def location_params
    params.require(:location).permit(:name, :purpose, address_attributes: [:line1, :line2, :city, :state, :zip])
  end
end
