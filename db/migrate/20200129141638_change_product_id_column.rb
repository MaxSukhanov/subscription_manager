class ChangeProductIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :plans, :product_id, :stripe_product_id
  end
end
