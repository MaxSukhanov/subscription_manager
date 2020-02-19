require 'create_subscription/create_subscription.rb'
class SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
  end

  def create
    result = CreateStripeSubscription.call(
      customer: session[:user_id],
      plan: plan,
      subscription: subscription_params
    )
    if result.succsess?
      redirect_to products_path
    else 
      redirect_to products_path, alert: "Subscription wasn't created. Try again"
    end
  end


  private
    def plan
      Plan.find_by(product_id: params[:product_id])
    end

    def subscription_params
      params.permit(:stripeToken)
    end
end