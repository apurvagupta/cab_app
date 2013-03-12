class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :is_admin, :only => [:edit,:index,:new,:show]

  def is_admin
    @is_admin = Admin.pluck(:name).include? session[:cas_user]
  end
end
