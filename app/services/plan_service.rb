class PlanService
  attr_reader :amount, :interval, :product

  def initialize(amount, interval, product)
    @amount = amount
    @interval = interval
    @product = product
  end

  def create_plan
    Stripe::Plan.create(
      amount: amount,
      currency: 'usd',
      interval: interval,
      product: product,
    )
  end
end
