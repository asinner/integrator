class VendorsController < ApplicationController
  layout :resolve_layout
  
  def index
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @vendors = @event.vendors.order(category: :asc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    @vendor = Vendor.new
    @vendor.contacts.build
    respond_to do |format|
      format.html { @vendors = @event.vendors.order(category: :asc) }
      format.js
    end
  end
  
  def create
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @vendor = @event.vendors.new(vendor_params)
    @contact = @vendor.contacts.first
    @contact.event_id = @event.id
    
    respond_to do |format|
      if @vendor.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def edit
    @vendor = Vendor.find(params[:id])
    @event = @vendor.event
    authorize @event, :find
    respond_to do |format|
      format.html { @vendors = @event.vendors.order(name: :asc) }
      format.js
    end
  end
  
  def update
    @vendor = Vendor.find(params[:id])
    @event = @vendor.event
    authorize @event, :find
    respond_to do |format|
      if @vendor.update_attributes(vendor_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def vendor_params
    params.require(:vendor).permit(:name, :category, contacts_attributes: [:first_name, :last_name, :position, :email, :phone_number])
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
