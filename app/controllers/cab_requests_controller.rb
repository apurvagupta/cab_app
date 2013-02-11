class CabRequestsController < ApplicationController
  require 'open-uri'

  def logout
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def index
    @cab_request = CabRequest.new
    @num = Array(1..50)
    @sources = ["Airport","Guest House","McKinsey","ThoughtWorks"]
    @destinations = ["Airport","Guest House","McKinsey","ThoughtWorks"]
    @hours= Array(01..12).map {|n| "%02d" % n}
    @minutes= [00,30].map {|n| "%02d" % n}
    @ampm=["am","pm"]
    gab_link
    @cab_request.requester = extract("name")
    @cab_request.contact_no = extract("mobile")
    admin_names
    @bool = @admin_array.include?(@cab_request.requester)
  end

  def gab_link
    @api =  "https://my.thoughtworks.com/api/core/v2/users/username/" + session[:cas_user]        rescue nil
    @source_code = open(@api, :http_basic_authentication => ["ppathak", "Maa_papa143"]).read      rescue nil
  end

  def extract (arg)
    @start_index =  @source_code.index(arg) + arg.length + 5                                      rescue nil
    @extracted_source_code = @source_code[@start_index , @start_index+50]                         rescue nil
    @end_index = @extracted_source_code.index('"')                                                rescue nil
    @extracted_source_code = @extracted_source_code[0 , @end_index ]                              rescue nil
  end

  def admin_names

    @detail = Detail.first
    @admin_array=[]
    extract_admin_names(@detail.assigned_admins)

  end

  def extract_admin_names(admins)

    @comma_index = admins.index(',')

    if @comma_index == nil

      @admin_array.push(admins.strip)
      return

    else

      @admin_name = admins[0 , @comma_index].strip
      @admin_array.push(@admin_name)
      admins = admins[@comma_index+1 , admins.length]
      extract_admin_names(admins)

    end

  end

end