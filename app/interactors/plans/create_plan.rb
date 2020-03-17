module Plans
  class CreateStripePlan
    include Interactor
    delegate :product, :interval, :amount, to: :context

    def call
      create_stripe_plan
      create_plan
    rescue StandardError => e
      Rails.logger.error(e.message)
    end

    private
      def create_stripe_plan
        plan = PlanService.new(product, interval, amount,).create_plan
        context.stripe_plan_id = plan.id
      end

      def create_plan
        Plan.create(
          stripe_id: context.stripe_plan_id,
          interval: interval,
          amount: amount,
        )
      end
  end
end
