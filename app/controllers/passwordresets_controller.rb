class PasswordresetsController < ApplicationController
  skip_before_filter :require_login, only:[:create, :edit, :update]

  def create
    @user = User.find_by_username(params[:username])
    @user.delay.deliver_reset_password_instructions! if @user
    redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
  end

  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]
    not_authenticated unless @user 
  end

  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(params[:token])
    not_authenticated and return unless @user
    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
