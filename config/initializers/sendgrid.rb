#ActionMailer::Base.logger = nil
ActionMailer::Base.delivery_method = Rails.env == 'test' ? :test : :smtp
ActionMailer::Base.perform_deliveries = Rails.env != 'test'
ActionMailer::Base.smtp_settings = {
    :address => "smtp.sendgrid.net",
    :port => 25,
    :domain => "elstg.com",
    :authentication => :plain,
    :user_name => "EndorseLiberty",
    :password => "viralideas1776"
}