class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice]= "you have successfully logged in"
      redirect_to user
    else
      flash.now[:alert] = "Wrong Credientials in Login Details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="user is logged out"
    redirect_to root_path
  end

end
