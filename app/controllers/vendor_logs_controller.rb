class VendorLogsController < ApplicationController

  layout :resolve_layout
  
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @event = @vendor.event
    authorize @event, :find
    @vendor_logs = @vendor.vendor_logs
    @vendor_log = VendorLog.new
    
    respond_to do |format|
      format.html { @vendors = @event.vendors.order(category: :asc) }
      format.js
    end
  end
  
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @event = @vendor.event
    authorize @event, :find
    @vendor_log = @vendor.vendor_logs.new(vendor_log_params)
    
    respond_to do |format|
      if @vendor_log.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end
  
  def destroy
    @vendor_log = VendorLog.find(params[:id])
    @vendor = @vendor_log.vendor
    @event = @vendor.event
    authorize @event, :find
    @vendor_log.destroy
 
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def vendor_log_params
    params.require(:vendor_log).permit(:body)
  end

  def resolve_layout
    case action_name
    when 'index'
      'event_overview_modal'
    else
      'event_overview'
    end
  end
end
