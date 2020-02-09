require_relative 'product_service'
class CreateStripeProduct
  include Interactor
  delegate :name, :description, to: :context

  def call
    create_stripe_product
    create_product
  rescue StandardError => e
    Rails.logger.error(e.message)
  end

  private
    def create_stripe_product
      product = Stripe::ProductService.new(
      name,
      description
      ).create_product
      context.stripe_product_id = product.id
    end

    def create_product
      Product.create(
        stripe_id: context.stripe_product_id,
        name: name,
        description: description
      )
    end
end