require 'create_customer/create_customer.rb'
class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end
    
  def create
    result = CreateStripeCustomer.call(
      customer_params: customer_params,
    )
    if result.success?
      session[:user_id] = result.customer[:id]
      session[:user_email] = result.customer[:email]
      redirect_to '/products'
    else
      redirect_to '/new'
    end
  end
    
    private
      def customer_params
        params.require(:customer).permit(:name, :email, :password)
      end
end
