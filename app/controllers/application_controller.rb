# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :fetch_requester_info

  def date_time_parser(date,time)
    unless date.nil? || time.nil?
      DateTime.parse(date + ' ' + time + ' +05:30').strftime('%F %T %z')
    end
  end


  def call_api
    unless session[:cas_user].nil?
      api = 'https://my.thoughtworks.com/api/core/v2/users/username/' + session[:cas_user] rescue nil
      $response = open(api, http_basic_authentication: ['booga', 'ooga']).read rescue nil
    end
  end

  def fetch_requester_info
    @req = Requester.new
    unless $response.nil?
      response_json = JSON.parse($response[$response.index('{')..$response.length])
      @req.requester_name       = response_json['name']
      @req.requester_contact_no = response_json['profile']['mobile']
    else
      @req.requester_name = session[:cas_user]
    end
    @req
  end

end
