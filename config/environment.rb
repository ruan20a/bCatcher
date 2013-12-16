# Load the Rails application.
require File.expand_path('../application', __FILE__)

BCatcher::Application.configure do

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "www.gmail.com",
    :user_name => "pricecatcher1",
    :password => "forever924",
    :authentication => "plain",
    :enable_starttls_auto => true
  }

end

# Initialize the Rails application.
BCatcher::Application.initialize!


