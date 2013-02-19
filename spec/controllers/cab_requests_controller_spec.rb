require "spec_helper"

describe RequestersController do
	context "index" do
		it "should redirect to CAS login page if user is not logged in" do
 			get:index
 			response.should redirect_to("https://cas.thoughtworks.com/cas/login?service=http%3A%2F%2Ftest.host%2Frequesters")
 		end
 	end
end