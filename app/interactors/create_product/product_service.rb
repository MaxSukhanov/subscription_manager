module Stripe
  class ProductService
    attr_reader :name, :desc

    def initialize(name, desc)
      @name, @desc = name, desc
    end

    def create_product
      Stripe::Product.create(
        name: name,
        type: "service",
        description: desc
      )
    end
  end
end