class RequestsController < ApplicationController
  before_action :current_user_must_be_request_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_request_user
    request = Request.find(params[:id])

    unless current_user == request.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @requests = Request.all

    render("requests/index.html.erb")
  end

  def show
    @request = Request.find(params[:id])

    render("requests/show.html.erb")
  end

  def new
    @request = Request.new

    render("requests/new.html.erb")
  end

  def create
    @request = Request.new

    @request.sender_id = params[:sender_id]
    @request.recipient_id = params[:recipient_id]

    save_status = @request.save

    if save_status == true
      redirect_to(:back, :notice => "Request created successfully.")
    else
      render("requests/new.html.erb")
    end
  end

  def edit
    @request = Request.find(params[:id])

    render("requests/edit.html.erb")
  end

  def update
    @request = Request.find(params[:id])

    @request.sender_id = params[:sender_id]
    @request.recipient_id = params[:recipient_id]

    save_status = @request.save

    if save_status == true
      redirect_to(:back, :notice => "Request updated successfully.")
    else
      render("requests/edit.html.erb")
    end
  end

  def destroy
    @request = Request.find(params[:id])

    @request.destroy

    redirect_to(:back, :notice => "Request deleted.")
  end
end
