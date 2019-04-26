class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.decimal :credit_limit, precision: 6, scale: 2
      t.decimal :apr, precision: 4, scale: 2
      t.integer :card_number
      t.integer :expiration_date
      t.integer :cvv
      t.decimal :balance, precision: 6, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
