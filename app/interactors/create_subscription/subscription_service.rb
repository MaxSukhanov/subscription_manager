module Stripe
  class SubscriptionService
    attr_reader :stripe_cus_id, :stripe_plan_id 

    def initialize(stripe_cus_id, stripe_plan_id)
      @stripe_cus_id = stripe_cus_id,
      @stripe_plan_id = stripe_plan_id
    end

    def create_customer
      Stripe::Subscription.create(
        customer: stripe_cus_id,
        items:[{plan: stripe_plan_id}]
      )
    end
  end
end