class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 6, scale: 2
      t.integer :date
      t.integer :credit_card_id

      t.timestamps
    end
  end
end
