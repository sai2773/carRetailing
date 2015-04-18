class AdminController < ApplicationController
  layout "stores"
  def login
  	if request.post?
  		if params[:admin][:name]=="admin" && params[:admin][:password]=="nimda"
  			session[:admin]="admin"
  			redirect_to :controller=>"stores", :action=>"index"
  		else
  			flash[:notice]="Invalid name/password"
  			render :action=>"login"
      end
   end
  end
  def logout
  	session[:admin]=nil
  	flash[:notice]="logged out"
  	redirect_to :action=>"login"
   end
end

