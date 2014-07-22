class NotesController < ApplicationController
  def new
    @notable = find_notable
    @note = @notable.notes.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @notable = find_notable
    authorize @notable, :find
    @note = @notable.notes.new(note_params)
    respond_to do |format|
      if @note.save
        format.html
        format.js
      else
        format.html
        format.js        
      end
    end
  end
  
  def note_params
    params.require(:note).permit(:message)
  end

  def find_notable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end


end
