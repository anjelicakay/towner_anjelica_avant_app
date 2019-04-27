class CreditCard < ApplicationRecord
  belongs_to :user
  
  has_many :charges
  has_many :payments

  def assign_card_number
    new_card_number = []
    16.times do
      new_card_number << rand(0..9)
    end
    self.card_number = new_card_number.join
  end

  def assign_cvv
    new_cvv = []
    3.times do 
      new_cvv << rand(0..9)
    end
    self.cvv = new_cvv.join
  end

  # def assign_expiration_date
    
  # end

  # def calculate_balance
  #   starting_balance = 1000

  #   charges.amount.each do |charge|
  #     starting_balance -= charge.amount
  #   end

  #   self.balance = starting_balance
  # end



end
