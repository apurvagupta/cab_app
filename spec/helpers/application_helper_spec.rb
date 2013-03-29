# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do

  it 'should convert time to IST correctly.' do
    original_time  = Time.now.utc
    expected_time  = (original_time + 19800).strftime('%I:%M %p')
    converted_time = ist(original_time)
    converted_time.should == expected_time

  end

  it 'should return true if the logged in user is admin' do
    session[:cas_user] = 'homer'
    Admin.create(name: 'homer', contact_no: '9876543212', status: false)
    CASClient::Frameworks::Rails::Filter.fake('homer')
    is_admin?.should == true
  end

  it 'should return false if the logged in user is not an admin' do
    CASClient::Frameworks::Rails::Filter.fake('homer')
    is_admin?.should == false
  end

  context 'current user' do
    it 'should return the session user if the session has a user' do
      session[:cas_user] = "chuck_norris"
      CASClient::Frameworks::Rails::Filter.fake("chuck_norris")
      current_user.should == "chuck_norris"
    end

    it "should return nil if the session doesn't have a user" do
      current_user.should be_nil
    end

  end

end
