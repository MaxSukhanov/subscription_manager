require_relative 'customer_service'
class CreateStripeCustomer
    include Interactor
    delegate :customer_params, to: :context

    def call
        create_stripe_customer
        create_customer
    rescue StandardError => e
        Rails.logger.error(e.message)
    end

    private
      def create_stripe_customer
        context.customer = Stripe::CustomerService.new(
          customer_params[:name],
          customer_params[:email],
        ).create_customer
      end

      def create_customer
        Customer.create(
          stripe_id: context.customer[:id],
          name: customer_params[:name],
          email: customer_params[:email],
          password: customer_params[:password],
        )
      end
end
