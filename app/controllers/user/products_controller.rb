require 'create_product/create_product.rb'
class User::ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @products = Product.all
  end

  private 

    def find_product
      @product = Product.find params[:id]
    end
end
