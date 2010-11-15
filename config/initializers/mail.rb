ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.mail.ru",
    :port => 25,
    :domain => "mail.ru",
    :authentication => :login,
    :user_name => "finexp",
    :password => "2044linux"
}
