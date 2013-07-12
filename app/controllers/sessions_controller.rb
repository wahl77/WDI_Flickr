class SessionsController < ApplicationController
  skip_before_filter :require_login, only:[:new, :create]

  def new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to user_path(current_user), notice:"Logged in Successfully!"
    else
      flash[:alert] = "Email or password invalid"
      render :new
    end
      
  end


  def destroy
    logout
    redirect_to root_path, notice:"Logged out"
  end


end
