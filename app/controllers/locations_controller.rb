class LocationsController < ApplicationController
  def index
    @locations = Location.all

    render("locations/index.html.erb")
  end

  def show
    @note = Note.new
    @bookmark = Bookmark.new
    @location = Location.find(params[:id])

    render("locations/show.html.erb")
  end

  def new
    @location = Location.new

    render("locations/new.html.erb")
  end

  def create
    @location = Location.new

    @location.name = params[:name]
    @location.address = params[:address]

    save_status = @location.save

    if save_status == true
      redirect_to(:back, :notice => "Location created successfully.")
    else
      render("locations/new.html.erb")
    end
  end

  def edit
    @location = Location.find(params[:id])

    render("locations/edit.html.erb")
  end

  def update
    @location = Location.find(params[:id])

    @location.name = params[:name]
    @location.address = params[:address]

    save_status = @location.save

    if save_status == true
      redirect_to(:back, :notice => "Location updated successfully.")
    else
      render("locations/edit.html.erb")
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    redirect_to(:back, :notice => "Location deleted.")
  end
end
