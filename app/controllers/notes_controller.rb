class NotesController < ApplicationController
  def index
    @notes = Note.all

    render("notes/index.html.erb")
  end

  def show
    @note = Note.find(params[:id])

    render("notes/show.html.erb")
  end

  def new
    @note = Note.new

    render("notes/new.html.erb")
  end

  def create
    @note = Note.new

    @note.description = params[:description]
    @note.user_id = params[:user_id]
    @note.location_id = params[:location_id]

    save_status = @note.save

    if save_status == true
      redirect_to(:back, :notice => "Note created successfully.")
    else
      render("notes/new.html.erb")
    end
  end

  def edit
    @note = Note.find(params[:id])

    render("notes/edit.html.erb")
  end

  def update
    @note = Note.find(params[:id])

    @note.description = params[:description]
    @note.user_id = params[:user_id]
    @note.location_id = params[:location_id]

    save_status = @note.save

    if save_status == true
      redirect_to(:back, :notice => "Note updated successfully.")
    else
      render("notes/edit.html.erb")
    end
  end

  def destroy
    @note = Note.find(params[:id])

    @note.destroy

    redirect_to(:back, :notice => "Note deleted.")
  end
end
