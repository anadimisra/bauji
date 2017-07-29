class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.integer :registration_quantity, null: false
      t.decimal :discount_value, precision: 6, scale: 2
      t.decimal :discount_percentage, precision: 3, scale: 2, default: 0.10

      t.timestamps
    end
    add_index :discounts, :discount_value
    add_index :discounts, :discount_percentage
  end
end
