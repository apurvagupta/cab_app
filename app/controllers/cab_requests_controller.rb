class CabRequestsController < ApplicationController
  require 'time'

  def new
    @req         = Requester.fetch_requester_info(session[:cas_user])
    @cab_request = CabRequest.new(requester: @req.requester_name, contact_no: @req.requester_contact_no)
  end

  def create

    @cab_request                   = CabRequest.new(params[:cab_request])
    @cab_request.pick_up_date_time = Time.new(params[:cab_request][:pick_up_date].to_date.year,
                                              params[:cab_request][:pick_up_date].to_date.month,
                                              params[:cab_request][:pick_up_date].to_date.day,
                                              @cab_request.pick_up_date_time.hour,
                                              @cab_request.pick_up_date_time.min,
                                              @cab_request.pick_up_date_time.sec,
                                              "+05:30") rescue nil
    if (@cab_request.source=='other')
      @cab_request.source=params[:source];
    end
    if (@cab_request.destination=='other')
      @cab_request.destination=params[:destination];
    end
    @other_source=params[:source]
    @other_destination=params[:destination]
    if @cab_request.save
      @notice = "YOUR REQUEST HAS BEEN SEND"
      redirect_to '/cab_requests/show'
    else
      render template: "cab_requests/new"
    end
  end

  def show

    Requester.is_admin(session[:cas_user])
    @req          = Requester.fetch_requester_info(session[:cas_user])
    @cab_requests = CabRequest.where(:requester => @req.requester_name)
    @dates        = []
    @cab_requests.each do |cr|
      @dates.push cr.pick_up_date_time.to_date
    end

    respond_to do |format|
      format.html
      format.xls
  end
  end

end
