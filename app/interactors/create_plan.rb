require "stripe_services.rb"
class CreateStripePlan
  include Interactor
  delegate :interval, :stripe_id, to: :context

  def call
    create_stripe_plan
    create_plan
  rescue StandardError => e
    Rails.logger.error(e.message)
  end

  private
    def create_stripe_plan
      p stripe_id
      plan = Stripe::PlanService.new(
        stripe_id,
        interval
      ).create_plan
      context.plan_id = plan.id
    end

    def create_plan
      Plan.create(
        product_id: stripe_id,
        stripe_plan_id: context.plan_id
      )
    end
end