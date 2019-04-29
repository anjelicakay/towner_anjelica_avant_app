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

  def total_charges
    balance_total = 0

    charges.each do |charge|
      if charge.amount > 0
        balance_total += charge.amount
      end
    end
    self.balance = balance_total
  end

  def calculate_interest
    d = Date.today
    today_date = d.mday

    if today_date == 30
      interest = balance * (0.35 / 365) * 30
      self.balance += interest
    end
  end

  def process_payment
    total_amount = balance
    payments.each do |payment|
      if payment.status == "pending"
        total_amount -= payment.amount
        payment.update(status: "completed")
      end
    end
  end

  def calculate_balance
    total_charges
    calculate_interest
    process_payment
    save
  end
end
