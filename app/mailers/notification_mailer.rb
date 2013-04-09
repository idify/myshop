class NotificationMailer < ActionMailer::Base
  default from: "myshop@gmail.com"

 def notify(user,sub,msg)
		@msg = msg
    mail(:to => user, :subject => sub)
  end
end
