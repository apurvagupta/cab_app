class CabRequestsController < ApplicationController


  def new
    @cab_request = CabRequest.new
    @req = Requester.new      
    @req.fetch_requester_info(session[:cas_user])
    @cab_request.init(@req.requester_name , @req.requester_contact_no)
  end


  def create
    # binding.pry
    @cab_request=CabRequest.new(params[:cab_request])
    @cab_request.pick_up_time = "#{params[:hours]}:#{params[:minutes]} #{params[:ampm]}"
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
