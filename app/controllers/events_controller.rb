class EventsController < ApplicationController
  before_filter :authenticate_user, except: :show
  
  def show
    @event = Event.find(params[:id])
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
    respond_to do |format|
      format.html
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
end