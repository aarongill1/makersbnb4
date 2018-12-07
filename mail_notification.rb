require 'mail'
require 'figaro'
require './credentials.rb'

class MailNotification
	attr_accessor :options

	def initialize(acc_email, acc_pwd)
	@options = { 
		:address => "smtp.gmail.com",
    :port    => 587,
    :user_name => acc_email,
    :password             => acc_pwd,
    :authentication       => 'plain',
    :enable_starttls_auto => true  
  }
	end

  Mail.defaults do
  	delivery_method :smtp, @options
	end

	def sign_up_email (user_email, user_name)
		mail = Mail.new do
			from 			@options[:user_name]
			to				user_email
			subject		'Welcome to MakersBnB'
			body			"Hello #{user_name} and Welcome to MakersBnB"
		end
		mail.deliver!
	end
end

cred = Credentials.new
mailer = MailNotification.new(cred.origin_email, cred.acc_password)


mailer.sign_up_email('maxstevenson@msn.com', 'Max')