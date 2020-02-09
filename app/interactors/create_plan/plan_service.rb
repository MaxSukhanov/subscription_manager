module Stripe
  class PlanService
    attr_reader :product

    def initialize(product)
      @product = product
    end

    def create_plan
      Stripe::Plan.create(
        build_plan_params
      )
    end

    def build_plan_params
      {
        amount: 50,
        currency: 'usd',
        interval: 'week',
        product: product.stripe_id,
      }
    end
  end
end