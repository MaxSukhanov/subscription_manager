class Product < ApplicationRecord
  has_many :plans
  validates :name, presence: true
  validates_associated :plans
end