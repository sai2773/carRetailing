class AccountController < ApplicationController
layout :false
def signUp
@user= User.new
if request.post?
	@user= User.new(params[:user].permit(:name, :email, :hashed_password, :password, :password_confirmation))
     session[:user]=@user.id
	if@user.save

		flash[:notice] ="You have successfully signed up."
		Notification.signUp_confirmation(@user).deliver
		redirect_to :action=> "login"
	else
	render :action=> "signUp"
	end
end	
end	

def login
if request.post?
	@user= User.authenticate(params[:user][:email],params[:user][:password])
	if @user
		session[:user]=@user.id
		redirect_to :action=> "welcome"
	else
		flash[:notice]= "Invalid username /Password"
		render :action=>"login"
    end	
end
end

def logout
	session[:user]=nil
	flash[:notice]="You have succesfully logged out"
	redirect_to :action=>"login"
end

def reset_password
	@user=User.find(session[:user])
    if request.post?
    	if @user
    		@user.update(:password=> params[:user][:password] )
    		Notification.reset_password(@user).deliver
    	flash[:notice]="Password has been reset"
    	redirect_to :action=> "welcome"
    else
    	render :action=>"reset_password"
        end
     end
end
def forget_password
if request.post?
	@user=User.find_by_email(params[:user][:email])
	if @user
		new_password= random_password
		Notification.random_password_send(@user, new_password).deliver
		@user.update(:password=>new_password)
		flash[:notice]="A new password has been sent to your mail."
		puts "======================================"
		puts new_password
		redirect_to :action =>"login"
	else
		flash[:notice]="Invaid email. Please provide valid email"
		render :action=>"forget_password"
end	
end
end

def random_password
(0...8).map{65.+(rand(25)).chr}.join
end	
end