require 'create_plan/create_plan.rb'
class PlansController < ApplicationController
 
  def create
    result = CreateStripePlan.call(
        product: product
      )
    if result.success?
      redirect_to products_path
    else
      render action: 'new'
    end
  end

  private

    def product
      Product.find(params[:product_id])
    end

    def; end
end
