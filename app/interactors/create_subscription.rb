require "stripe_services.rb"
class CreateSubscription
  include Interactor
  delegate :customer_id, :plan_id, to: :context
  
    def call
      create_stripe_subscription
      create_subscription
    rescue StandardError => e
      Rails.logger.error(e.message)
    end
  
    private
      def create_stripe_subscription
        Stripe::Subscription.create({
        customer: customer_id,
        items: [{plan: plan_id}],
        })
      end
  
      def create_subscription
        Subscription.create(
          customer: customer_id,
          plan: plan_id
        )
      end
  end