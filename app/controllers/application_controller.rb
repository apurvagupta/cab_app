# -*- encoding : utf-8 -*-
require 'yaml'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :fetch_requester_info

  def date_time_parser(date, time)
    unless date.nil? || time.nil?
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
      $response = open(requester_details_api, http_basic_authentication: [requester_configs['user_id'],requester_configs['password']]).read rescue nil
    end
  end

  def fetch_requester_info
    @req = Requester.new
    if $response.nil?
      call_api
    end
    response_json = JSON.parse($response[$response.index('{')..$response.length]) if $response
    unless response_json.nil?
      @req.requester_name = response_json['name']
      @req.requester_contact_no = response_json['profile']['mobile']
    else
      @req.requester_name = session[:cas_user]
    end
    @req
  end

end
