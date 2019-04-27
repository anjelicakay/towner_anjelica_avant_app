class CreditCard < ApplicationRecord
  belongs_to :user
  
  has_many :charges
  has_many :payments
end
