class SubscriptionsController < ApplicationController
  before_action 
  def create
  end

  private
    def find_product
      @product = Product.find params[:id]
    end
end
