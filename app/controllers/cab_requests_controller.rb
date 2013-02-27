class CabRequestsController < ApplicationController
  require 'time'

  def index
    redirect_to new_cab_request_path
  end

  def new
    @req = Requester.fetch_requester_info(session[:cas_user])
    @cab_request = CabRequest.new(:requester => @req.requester_name, :contact_no => @req.requester_contact_no)
  end

  def create
    @cab_request=CabRequest.new(params[:cab_request])
    if @cab_request.save
      @notice = "YOUR REQUEST HAS BEEN SEND"
      redirect_to '/cab_requests/show'
    else
      render :template => "cab_requests/new"
    end
  end

  def show
    @req = Requester.new.fetch_requester_info(session[:cas_user])
    @cab_request_array=CabRequest.all(:conditions => {:requester => @req.requester_name})
  end

end
