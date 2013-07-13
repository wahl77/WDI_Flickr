class TransactionController < ApplicationController
  def create
    @amount = params[:quantity].to_i*3*100 # 300 cents a cents
    

    charge = Stripe::Charge.create(
      :amount      => @amount,
      :description => "User #{current_user.username} for #{params[:quantity]}",
      :card        => params[:stripeToken],
      :currency    => 'usd'
    )

    current_user.quota += params[:quantity].to_i
    current_user.save


    flash[:notice] = "Succeffully updated"
    
    redirect_to user_path(current_user) 
    

    rescue Stripe::CardError => e
      flash[:error] = e.message
      flash[:alert] = e.message
      redirect_to user_path(current_user) 
  end
end
