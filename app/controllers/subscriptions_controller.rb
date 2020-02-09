require 'create_subscription/create_subscription.rb'
class SubscriptionsController < ApplicationController
  #before_action :find_plan, only: [:create]
  def new
  end

  def create
    result = CreateStripeSubscription.call(
      customer: session[:user_id]
    )
    if result.success?
      redirect_to '/products'
    end   
  end

  private
    def find_plan
      Plan.find_by(product_id: params[:product_id])
    end
end