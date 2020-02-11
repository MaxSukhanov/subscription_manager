require 'create_subscription/create_subscription.rb'
class SubscriptionsController < ApplicationController
  before_action :find_plan, only: [:create]
  skip_before_action :verify_authenticity_token
  
  def new
  end

  def create
    CreateStripeSubscription.call(
      customer: session[:user_id],
      plan: plan,
      subscription: subscription_params
    )
    redirect_to '/products'
  end


  private
    def find_plan
      @plan = Plan.find_by(product_id: params[:product_id])
    end

    def subscription_params
      params.permit(:stripeToken)
    end
end