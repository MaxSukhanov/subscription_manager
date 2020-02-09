class Plan < ApplicationRecord
    belongs_to :product
    validates :interval, :amount, presence: true
end
