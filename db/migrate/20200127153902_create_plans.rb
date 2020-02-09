class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :stripe_id
      t.string :product_id
      t.string :interval
      t.float :amount

      t.timestamps
    end
  end
end
