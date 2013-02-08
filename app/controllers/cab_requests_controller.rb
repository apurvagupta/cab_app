class CabRequestsController < ApplicationController

  #def logout
  #  cookies.delete :auth_token
  #  reset_session
  #  flash[:notice] = "You have been logged out."
  #  CASClient::Frameworks::Rails::Filter.logout(self)
  #end

  def index
    @cab_request = CabRequest.new
    @num = Array(1..50)
    @sources = ["Airport","Guest House","McKinsey","ThoughtWorks"]
    @destinations = ["Airport","Guest House","McKinsey","ThoughtWorks"]
    @hours= Array(01..12).map {|n| "%02d" % n}
    @minutes= [00,30].map {|n| "%02d" % n}
    @ampm=["am","pm"]
  end
end