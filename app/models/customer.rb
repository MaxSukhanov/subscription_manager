class Customer < ApplicationRecord
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end
