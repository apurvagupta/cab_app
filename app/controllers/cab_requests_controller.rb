# -*- encoding : utf-8 -*-
class CabRequestsController < ApplicationController
  require 'time'

  def index
    redirect_to '/cab_requests/new'
  end

  def new
    call_api
    @cab_request = CabRequest.new(requester: @req.requester_name, contact_no: @req.requester_contact_no)
  end

  def create
    @cab_request                   = CabRequest.new(params[:cab_request])
    @cab_request.requester         = session[:cas_user]

    @cab_request.pick_up_date_time = date_time_parser(params[:cab_request][:pick_up_date],params[:cab_request][:pick_up_date_time])

    @other_source=params[:source]
    @other_destination=params[:destination]

    if @cab_request.source == 'other'
      @cab_request.source = @other_source
    end
    if @cab_request.destination == 'other'
      @cab_request.destination = @other_destination
    end

    if @cab_request.save
      @notice = 'YOUR REQUEST HAS BEEN SENT'
      redirect_to '/cab_requests/show'
    else
      render template: 'cab_requests/new'
    end
  end

  def show
    @cab_requests = CabRequest.where(requester: @req.requester_name)
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
