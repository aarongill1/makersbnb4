# require 'mail'
require 'figaro'
require 'net/smtp'
require './credentials'

class Email
  def self.create(to, email_cred, email_pwd, message_content)
    our_smtp_server = 'smtp.gmail.com'
    our_smtp_port = 587
    our_message = "From: MakersBnB <#{email_cred}>\nTo: <#{to}>\nSubject: Test\n#{message_content}" 
    smtp = Net::SMTP.new(our_smtp_server, our_smtp_port)
    smtp.enable_starttls # this is dependant on the smtp_server's authentication method
    smtp.start('localhost', email_cred, email_pwd, :login) do |smtp|
      smtp.send_message our_message, email_cred, to
    end
  end

 	def self.sign_up(name)
 		"Hello #{name}. Thank you for signing up to MakersBnB!"
 	end

 	def self.create_property(name)
 		"#{name}, You have just listed one new property on MakersBnB.\nWe will notify you when someone has requested to stay at this property."
 	end

 	def self.request_property(name, property_name, user_name, from, to)
 		"Hi #{name}, #{user_name} just requested to stay at #{property_name} between #{from} until #{to}."
 	end
end