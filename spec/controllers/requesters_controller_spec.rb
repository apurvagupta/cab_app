require 'spec_helper'

describe RequestersController do


  #it "should redirect to CAS login page if user is not logged in" do
  #  get :new
  #  if !session[:cas_sent_to_gateway].nil?
  #    response.should redirect_to("https://cas.thoughtworks.com/cas/login?service=http%3A%2F%2Ftest.host%2Fcab_requests%2Fnew")
  #  end
  #end
  #
  #it "should redirect to new request page if user is logged in" do
  #  CASClient::Frameworks::Rails::Filter.fake("homer")
  #  get :new
  #  response.should render_template("cab_requests/new")
  #end
  context "logout" do
    it "should log out successfully" do
      CASClient::Frameworks::Rails::Filter.fake("homer")
      get :logout
      response.should redirect_to("https://cas.thoughtworks.com/cas/logout?service")
    end
  end
end
