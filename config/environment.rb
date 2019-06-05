# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Configuration for Sendgrid
ActionMailer::Base.smtp_settings = {
    :user_name => ENV['SENDGRID_LOGIN'],
    :password => ENV['SENDGRID_PWD'],
    :domain => 'bibimbapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
