class BookmarksController < ApplicationController
  before_action :current_user_must_be_bookmark_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_bookmark_user
    bookmark = Bookmark.find(params[:id])

    unless current_user == bookmark.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @bookmarks = Bookmark.all

    render("bookmarks/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/show.html.erb")
  end

  def new
    @bookmark = Bookmark.new

    render("bookmarks/new.html.erb")
  end

  def create
    @bookmark = Bookmark.new

    @bookmark.location_id = params[:location_id]
    @bookmark.user_id = params[:user_id]
    @bookmark.dogear = params[:dogear]

    save_status = @bookmark.save

    if save_status == true
      redirect_to(:back, :notice => "Bookmark created successfully.")
    else
      render("bookmarks/new.html.erb")
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/edit.html.erb")
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.location_id = params[:location_id]
    @bookmark.user_id = params[:user_id]
    @bookmark.dogear = params[:dogear]

    save_status = @bookmark.save

    if save_status == true
      redirect_to(:back, :notice => "Bookmark updated successfully.")
    else
      render("bookmarks/edit.html.erb")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to(:back, :notice => "Bookmark deleted.")
  end
end
