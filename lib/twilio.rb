# Get twilio-ruby from twilio.com/docs/ruby/install
      
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC491f53e83618d21896f2ae3d1be302d8'
auth_token = ENV['TWILIO_API_KEY']
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "The free stuff fairy has found an item for you! Please visit #{ADD THIS URL} to accept or deny the offer." ,
    :to => "+14125088025",
    :from => "+14123075863",
   # :media_url => "http://www.example.com/hearts.png")
puts message.to