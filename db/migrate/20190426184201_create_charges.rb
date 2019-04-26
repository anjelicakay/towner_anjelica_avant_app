class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :date
      t.string :vendor
      t.decimal :amount, precision: 6, scale: 2
      t.integer :credit_card_id

      t.timestamps
    end
  end
end
