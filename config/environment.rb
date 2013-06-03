  # -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

require 'casclient'
require 'casclient/frameworks/rails/filter'

# Initialize the rails application
CabApp::Application.initialize!

CASClient::Frameworks::Rails::Filter.configure(
    :cas_base_url => "https://cas.thoughtworks.com/cas/"
)

ActionMailer::Base.smtp_settings = {
    :user_name => "twcabrequest",
    :password => "Th0ughtW0rk$",
    :domain => "gmail.com",
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
