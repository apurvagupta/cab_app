class CabRequestsController < ApplicationController

  def logout

    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    CASClient::Frameworks::Rails::Filter.logout(self)

  end



end


