# require 'mail'
require 'figaro'
require 'net/smtp'
require './credentials'

class Email
  def self.create(to, email_cred, email_pwd)
    our_smtp_server = 'smtp.gmail.com'
    our_smtp_port = 587
    our_email = email_cred
    our_password = email_pwd
    our_message = "From: <#{our_email}>\nTo: <#{to}>\nSubject: Test"
    smtp = Net::SMTP.new(our_smtp_server, our_smtp_port)
    smtp.enable_starttls # this is dependant on the smtp_server's authentication method
    smtp.start('localhost', our_email, our_password, :login) do |smtp|
      smtp.send_message our_message, our_email, to
    end
  end
end

cred_1 = Credentials.new
Email.create("maxstevenson@msn.com", cred_1.sender_email, cred_1.sender_pwd)