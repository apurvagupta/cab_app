require 'spec_helper'

describe RequestersController do
  context 'logout' do
    it 'should log out successfully' do
      CASClient::Frameworks::Rails::Filter.fake('homer')
      get(:logout).should redirect_to('https://cas.thoughtworks.com/cas/logout?service')
    end
  end
end
