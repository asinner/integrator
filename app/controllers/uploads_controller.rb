class UploadsController < ApplicationController
  
  layout :resolve_layout
  
  def index
    @event = Event.find(params[:event_id])
    authorize @event, :find
    @uploads = @event.uploads
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    @upload = Upload.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    # An array that will contain messages pertaining to errors and successes
    @messages = []
    
    # The event we are upload files to
    @event = Event.find(params[:event_id])
    authorize @event, :find
    
    # An empty array that will hold all AR objects
    @uploads = []
    
    # Loop through each file (ensures files are present in the POST params)
    if params.has_key?(:upload) && params[:upload][:file].present?
      
      # Loop
      params[:upload][:file].each do |file|
        
        # Create a new object
        upload = @event.uploads.new
        
        # Pass the AR object into an array
        @uploads << upload
        
        # Give the AR object attributes taken from the file
        upload.assign_attributes_from_file(file)
        
        # If the AR object saves and the file gets uploaded to S3...
        if upload.save && upload.to_s3(file)
          
          # ...then create a success message for that AR object
          message = { type: 'success', body: "#{upload.original_filename} successfully uploaded" }
          @messages << message
          next
          
        else
          
          # ...otherwise there was an error
          message = { type: 'error', body: "#{upload.original_filename} failed to upload. Error: #{upload.errors.full_messages.first}" }
          @messages << message
          next
          
        end
      end
      
    else
      
      # ...otherwise there were no files
      message = { type: 'error', body: 'Please select files to upload' }
      @messages << message
      
    end
  end
  
  def resolve_layout
    case action_name
    when 'index'
      'event_overview'
    when 'create'
      'iframe'
    else
      'application'
    end
  end
end
