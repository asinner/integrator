class EventsController < ApplicationController
  before_filter :authenticate_user, except: :show
  layout :resolve_layout
  
  def show
    @event = Event.find(params[:id])
    
    @timeline = @event.timeline
    @uploads = @event.uploads
    @contacts = @event.contacts
    @locations = @event.locations
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
    @events = current_user.account.events
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @event = Event.new
    
    # Build out locations and addresses foreach location
    2.times { @event.locations.build }
    @event.locations.each { |location| location.build_address }
    
    # Build out vendors and contacts foreach vendor
    2.times { @event.vendors.build }
    @event.vendors.each { |vendor| vendor.contacts.build }
    
    respond_to do |format|
      format.html { @events = current_user.account.events }
      format.js
    end
  end
  
  def create
    @event = current_user.account.events.new(event_params)
    respond_to do |format|
      if @event.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    authorize @event, :find
    respond_to do |format|
      format.html { @events = current_user.account.events }
      format.js
    end
  end

  def update
    @event = Event.find(params[:id])
    authorize @event, :find
    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
    
  end
  
  def overview
    @event = Event.find(params[:id])
    # Ensure event belongs to current users account
    authorize @event, :find
        
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def event_params
    params.require(:event).permit(:name, :starting_date)
  end

  def resolve_layout
    case action_name
    when 'new', 'edit'
      'event_index_modal'
    else
      'application'
    end
  end

end
