# frozen_string_literal: true
require 'stripe'
Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'
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

  class PlanService
    attr_reader :stripe_prod_id, :interval

    def initialize(stripe_prod_id, interval)
      @stripe_prod_id = stripe_prod_id
      @interval = interval
    end

    def amount
      if interval == 'week'
        50
      elsif interval == 'month'
        150  
      end
    end

    def create_plan
      Stripe::Plan.create(
        amount: amount,
        currency: 'usd',
        interval: interval,
        product: stripe_prod_id
      )
    end
  end

  class CustomerService
    attr_reader :name, :email 

    def initialize(name, email)
      @name, @email = name, email
    end

    def create_customer
      Stripe::Customer.create(
        name: name,
        email: email
      )
    end
  end

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