class ChangeIntegerLimitInCreditCards < ActiveRecord::Migration[5.2]
  def change
    change_column :credit_cards, :card_number, :integer, limit: 8
  end
end
