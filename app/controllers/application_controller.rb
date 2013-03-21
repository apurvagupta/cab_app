class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter

  def date_time_parser(date,time)
    unless date.nil? || time.nil?
      DateTime.parse(date + ' ' + time + ' +05:30').strftime('%F %T %z')
    end
  end
end
