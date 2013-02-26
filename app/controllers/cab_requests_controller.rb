class CabRequestsController < ApplicationController

  def index
    redirect_to new_cab_request_path
  end

  def new
    @req = Requester.new.fetch_requester_info(session[:cas_user])
    @cab_request = CabRequest.new(:requester => @req.requester_name, :contact_no => @req.requester_contact_no)
    @is_admin = Admin.all.collect(&:name).include?(@req.requester_name) || @req.requester_name == session[:cas_user]
  end

  def create
    @cab_request=CabRequest.new(params[:cab_request])
    if @cab_request.save
      redirect_to cab_request_path(@cab_request)
    else
      render :template => "cab_requests/new"
    end
  end

  def show
    @cab_request=CabRequest.find(params[:id])

    @cab_request_array=CabRequest.all(:conditions => {:requester => @cab_request.requester})
  end

end
