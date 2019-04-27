class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :credit_cards
  has_many :charges, through: :credit_cards
  has_many :payments, through: :credit_cards
end
