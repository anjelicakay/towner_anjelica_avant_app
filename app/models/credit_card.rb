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

  def calculate_balance
    starting_balance = 0

    charges.each do |charge|
      if charge.amount > 0
        starting_balance += charge.amount
      end
    end

    # if 
    #   starting_balance * (0.35 / 365) * 30

    # self.balance = starting_balance
  end



end
