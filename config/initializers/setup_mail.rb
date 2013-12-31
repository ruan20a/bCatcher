ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "www.gmail.com",
  :user_name => ENV['CATCHER_USERNAME'],
  :password => ENV['CATCHER_PASSWORD'],
  :authentication => "plain",
  :enable_starttls_auto => true
}