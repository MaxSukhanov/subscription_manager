module Stripe
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
end