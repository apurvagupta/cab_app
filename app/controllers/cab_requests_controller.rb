class CabRequestsController < ApplicationController
  require 'time'

  def index
    redirect_to new_cab_request_path
  end

  def new
    @req         = Requester.fetch_requester_info(session[:cas_user])
    @cab_request = CabRequest.new(requester: @req.requester_name, contact_no: @req.requester_contact_no)
  end

  def create
    @cab_request                   = CabRequest.new(params[:cab_request])
    @cab_request.pick_up_date_time = Time.new(params[:pick_up_date].to_date.year, params[:pick_up_date].to_date.month, params[:pick_up_date].to_date.day, @cab_request.pick_up_date_time.hour, @cab_request.pick_up_date_time.min, @cab_request.pick_up_date_time.sec, "+05:30") rescue nil
    if @cab_request.save
      @notice = "YOUR REQUEST HAS BEEN SEND"
      redirect_to '/cab_requests/show'
    else
      render template: "cab_requests/new"
    end
  end

  def show
    @req               = Requester.fetch_requester_info(session[:cas_user])
    @cab_request_array = CabRequest.all(conditions: { requester: @req.requester_name })
    @date_array        = []
    @cab_request_array.each do |cr|
      @date_array.push cr.pick_up_date_time.to_date
    end
  end

end
