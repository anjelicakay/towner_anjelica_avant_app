class Payment < ApplicationRecord
  belongs_to :credit_card
  
  has_one :user, through: :credit_card
end
