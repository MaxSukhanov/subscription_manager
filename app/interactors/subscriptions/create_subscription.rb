module Subscriptions
  class CreateStripeSubscription
    include Interactor
    delegate :customer, :plan, to: :context
  
    def call
      create_stripe_subscription
      create_subscription
    rescue StandardError => e
      Rails.logger.error(e.message)
    end
  
    private
      def create_stripe_subscription
        SubscriptionService.new(
          customer,
          plan,
        )
      end
  
      def create_subscription
        Subscription.create(
          customer: customer,
          plan: plan
        )
      end
  end
end
