require 'create_plan/create_plan.rb'
class PlansController < ApplicationController
  before_action :authenticate_user!
 
  def create
    result = CreateStripePlan.call(
        product: product
      )
    if result.success?
      redirect_to products_path
    else
      redirect_to products_path, alert: "Something goes wrong"
    end
  end

  private

    def product
      Product.find(params[:product_id])
    end
end
