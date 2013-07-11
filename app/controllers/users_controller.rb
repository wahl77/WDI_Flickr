class UsersController < ApplicationController

  skip_before_filter :require_login, only:[:new, :create, :activate]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Send E-mail Confirmation
      UserMailer.activation_needed_email(@user).deliver
      redirect_to root_path, notice:"User created. Check for e-mail"
    else
      render :new
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

end
