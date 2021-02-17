# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.routes.default_url_options[:host] = "localhost:3000"

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => 'your_sendgrid_api_key',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
