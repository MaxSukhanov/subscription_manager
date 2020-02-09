require 'create_product/create_product.rb'
class Admin::ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    result = CreateStripeProduct.call(
      product_params
    )
    if result.success?
      redirect_to admin_products_path
    else
      render action: 'new'
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "Product was deleted"
  end

  private 
    def product_params
      params.require(:product).permit(:name, :description)
    end

    def find_product
      @product = Product.find params[:id]
    end
end
