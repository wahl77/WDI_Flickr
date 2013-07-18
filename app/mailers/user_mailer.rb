class UserMailer < ActionMailer::Base
  default from: "from@example.com"

#  handle_asynchronously :signup_confirmation 
#  handle_asynchronously :activation_needed_email 
#  handle_asynchronously :activation_success_email
#  handle_asynchronously :reset_password_email


  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Test"
  end

  def activation_needed_email(user)
    @user = user
    mail to:user.email, subject:"Activation Required" 
  end

  def activation_success_email(user) 
    @user = user
    mail to:user.email, subject:"Success"
  end

  def reset_password_email(user) 
    @user = user
    mail to:user.email, subject:"Password Reset Request"
  end

  def welcome(user)
    @user = user
    mail to: @user.email
  end
end
