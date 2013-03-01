require 'spec_helper'

describe CabRequestsController do
	
	context 'create' do
		it 'should redirect to show path if saved' do
      @pick_up_date = "07/02/2913"
			@cab_request ={:requester=>"Priyanka Pathak", :traveler_name=>"self",:pick_up_date_time => Time.new(2913,02,07,4,0,0,"+05:30"), :contact_no=>"9039409828", :source=>"Guest House", :destination=>"ThoughtWorks", :no_of_passengers=>1, :comments=>"something"}
			CASClient::Frameworks::Rails::Filter.fake("homer")
			post :create, :cab_request => @cab_request , :pick_up_date => @pick_up_date
      response.should redirect_to ("/cab_requests/show")
	    end		
        
		it 'should render new cab request template if not saved' do
			CASClient::Frameworks::Rails::Filter.fake("homer")
			post :create
			response.should render_template("cab_requests/new")
	    end
	end
end
