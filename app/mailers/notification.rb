class Notification < ApplicationMailer
default from: "from@example.com"

def signUp_confirmation(user)
	@user=user
	mail(:to =>(user.email), :subject=>"welcome ")
end

def random_password_send(user,password)
	@user=user
	@password=password
	mail(:to => (user.email), :subject=>"temporary password")
end

def reset_password(user)
	@user= user
	mail(:to => (user.email), :subject=>"your password has been reset")
end
end
