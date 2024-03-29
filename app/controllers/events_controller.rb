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
    
    # Create new a event
    @event = Event.new
    
    # Build the clients
    2.times { @event.clients.build }
    
    # Build the locations and address
    2.times { @event.locations.build.build_address }
        
    respond_to do |format|
      format.html { @events = current_user.account.events }
      format.js
    end
  end
  
  def create
    
    # Build an event from the current users account and strong parameters
    @event = current_user.account.events.new(event_params)
        
    # Format the response
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
    
    # Find the event
    @event = Event.find(params[:id])
    
    # Authorization
    authorize @event, :find
    
    if params[:workflow]
      @workflow = true
    end
    
    # Response
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
    params.require(:event).permit(
    :name, 
    :starting_date,
    clients_attributes: [
        :first_name,
        :last_name
      ]
    )
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
