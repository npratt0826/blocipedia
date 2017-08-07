class ChargesController < ApplicationController
  
  def create
    @amount = 500
    
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      
      )
      
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "BigMoney Membership - #{current_user.email}",
      currency: "usd"
      )
        
      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      redirect_to user_path(current_user)
      
      rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path  
      
  end
  
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.email}",
     amount: @amount
   }
  end
  
  
end
