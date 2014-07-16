class LocationsController < ApplicationController
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
    @event = Event.find(params[:event_id])
    @location = Location.new
    @location.build_address
    respond_to do |format|
      format.html
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
  
  def location_params
    params.require(:location).permit(:name, :purpose, address_attributes: [:line1, :line2, :city, :state, :zip])
  end
end
