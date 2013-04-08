# -*- encoding : utf-8 -*-
require 'will_paginate/array'
require 'yaml'
class CabRequestsController < ApplicationController
  require 'time'

  def index
    if @is_admin
      redirect_to '/support_centers/show'
    else
      redirect_to '/cab_requests/new'
    end
  end

  def new
    session[:requester] ||= fetch_requester_info
    @cab_request = CabRequest.new(requester: session[:cas_user], traveler_name: session[:requester].requester_name, contact_no: session[:requester].requester_contact_no)
  end

  def create
    @cab_request                   = CabRequest.new(params[:cab_request])
    @cab_request.requester         = session[:cas_user]
    @cab_request.pick_up_date_time = date_time_parser(params[:cab_request][:pick_up_date],params[:cab_request][:pick_up_date_time])
    @other_source=params[:source]
    @other_destination=params[:destination]
    if @cab_request.source == 'other'
       @cab_request.source = @other_source
       @source             = 'other'
    end
    if @cab_request.destination == 'other'
       @cab_request.destination = @other_destination
       @destination             = 'other'
    end
    if @cab_request.save
       redirect_to '/cab_requests/show', {:notice => 'Your request has been sent with ReqID ' + @cab_request.id.to_s}
    else
       render template: 'cab_requests/new'
    end
  end

  def show
    @cab_requests = CabRequest.where(requester: session[:cas_user]).reverse
    @cab_requests_page = @cab_requests.paginate(page: params[:page], per_page: 10)
    @dates        = []
    @cab_requests.each do |cr|
      @dates.push cr.pick_up_date_time.to_date
    end
    respond_to do |format|
      format.html
      format.xls
  end
  end

private
  def date_time_parser(date, time)
    unless date=="" || time==""
      DateTime.parse(date + ' ' + time + ' +05:30').strftime('%F %T %z')
    end
  end

  def load_config
    config_file = Rails.root.join('base_config.yaml')
    if File.exists? config_file
      base_config = YAML.load_file(config_file)
    else
      base_config = {}
    end

    base_config
  end

  def call_api
    requester_configs = load_config['requester_details'] if load_config
    unless session[:cas_user].nil? || requester_configs.nil?
      requester_details_api = requester_configs['base_api'] + session[:cas_user]
      response = open(requester_details_api, http_basic_authentication: [requester_configs['user_id'],requester_configs['password']]).read rescue nil
    end
    response
  end

  def fetch_requester_info
    @req = Requester.new
    response = call_api
    response_json = JSON.parse(response[response.index('{')..response.length]) if response
    unless response_json.nil?
      @req.requester_name = response_json['name']
      @req.requester_contact_no = response_json['profile']['mobile']
    end
    @req
  end

end
