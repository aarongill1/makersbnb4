require 'mail'
require './credentials'

class MailNotification
	@@cred = Credentials.new
	@@options = { 
		:address => "smtp.gmail.com",
    :port    => 587,
    :user_name => @@cred.origin_email,
    :password             => @@cred.acc_password,
    :authentication       => 'plain',
    :enable_starttls_auto => true  
  }

	def self.sign_up_email (user_email, user_name)
		mail = Mail.new do
			from 			@@cred.origin_email
			to				user_email
			subject		'Welcome to MakersBnB'
			body			"Hello #{user_name} and Welcome to MakersBnB"
		end
		mail.delivery_method :smtp
		mail.deliver!
	end
end

MailNotification.sign_up_email('maxstevenson@msn.com', 'Max')