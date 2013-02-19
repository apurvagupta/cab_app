require 'spec_helper'

describe CabRequestsController do
	
	context 'create' do
		it 'should redirect to show path if saved' do
			@cab_request ={:requester=>"Priyanka Pathak", :pick_up_for=>"self", :contact_no=>"9039409828", :pick_up_time => "5:30 pm", :date=>"21/02/2013", :source=>"Guest House", :destination=>"ThoughtWorks", :no_of_passengers=>1, :comments=>"something"}
			CASClient::Frameworks::Rails::Filter.fake("homer")
			post :create, :cab_request => @cab_request
			response.should redirect_to ("http://test.host/cab_requests/1")
	    end		
        
		it 'should render new cab request template if not saved' do
			# @cab_request ={:requester=>"Priyanka Pathak", :pick_up_for=>"self", :contact_no=>"9039409828", :pick_up_time => "5:30 pm", :date=>"21/02/2013", :source=>"Guest House", :destination=>"ThoughtWorks", :no_of_passengers=>1, :comments=>"something"}
			CASClient::Frameworks::Rails::Filter.fake("homer")
			post :create #, :cab_request => @cab_request
			response.should render_template("cab_requests/new")
	    end		
        
	end
end