require_relative "plan_service"
class CreateStripePlan
  include Interactor

  def call
    create_stripe_plan
    create_plan
  rescue StandardError => e
    Rails.logger.error(e.message)
  end

  private
    def create_stripe_plan
      context.plan = Stripe::PlanService.new(
        context.product
      ).create_plan
    end

    def create_plan
        context.product.plans.create(
          stripe_id: context.plan[:id],
          interval: context.plan[:interval],
          amount: context.plan[:amount],
        )
    end
end