class ContactsController < ApplicationController
  
  layout :resolve_layout
  
  def index
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @contacts = @event.contacts.where(vendor_id: nil).order(last_name: :asc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    @contact = Contact.new
    respond_to do |format|
      format.html { @contacts = @event.contacts.where(vendor_id: nil).order(last_name: :asc) }
      format.js
    end
  end
  
  def create
    @contact = Contact.new(contact_params)
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @contact = @event.contacts.new(contact_params)
    @vendor = @contact.vendor
    # Ensure that the associated vendor belongs to the authorized event
    if params[:vendor_id] 
      authorize @vendor, :find
    end
    
    respond_to do |format|
      if @contact.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
    @event = @contact.event
    authorize @event, :find
    respond_to do |format|
      format.html { @contacts = @event.contacts.where(vendor_id: nil).order(last_name: :asc) }
      format.js
    end
  end
  
  def update
    @contact = Contact.find(params[:id])
    @event = @contact.event
    authorize @event, :find    
    respond_to do |format|
      if @contact.update_attributes(contact_params)
        format.html
        format.js
      else
        format.html
        format.js
      end
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

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email, :phone_number, :vendor_id)
  end
end
  