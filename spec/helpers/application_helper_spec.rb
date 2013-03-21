require 'spec_helper'

describe ApplicationHelper do

  it 'should convert time to IST correctly.'do
    original_time = Time.now.utc
    expected_time = (original_time + 19800).strftime('%I:%M %P')
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
end