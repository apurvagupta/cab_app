require 'spec_helper'

describe RequestersController do

	context "index" do

		it "should redirect to CAS login page if user is not logged in" do
					get :index
       		response.should redirect_to("https://cas.thoughtworks.com/cas/login?service=http%3A%2F%2Ftest.host%2Frequesters")
 		end

 		it "should redirect to new request page if user is logged in" do
 			CASClient::Frameworks::Rails::Filter.fake("homer")
 			get :index
			response.should redirect_to(new_cab_request_path)
			get :logout
 		end
 	end

 	context "logout" do

     it "should log out successfully" do
 			CASClient::Frameworks::Rails::Filter.fake("homer")
 			get :logout
 			response.should redirect_to("https://cas.thoughtworks.com/cas/logout?service")
 	  end
   end
end