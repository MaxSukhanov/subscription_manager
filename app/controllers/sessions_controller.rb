class SessionsController < ApplicationController
  before_action :find_customer, only: [:create]

  def new
  end

  def create
    if @customer && @customer.authenticate(params[:password])
      session[:user_id] = @customer[:stripe_id]
      session[:user_email] = @customer[:email]
      redirect_to products_path
    else
      flash.now[:alert] = "Something goes wrong"
      render 'new'
    end
  end

  def login
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path, notice: 'You have logged out'
  end

  private 
    def find_customer
      @customer = Customer.find_by(
        name: params[:name]
      )
    end
end
