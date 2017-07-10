class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.integer :number, null: false, default: 5
      t.date :valid_till, null: false
      t.boolean :active, null: false, default: false
      t.references :workshop, foreign_key: true
      t.belongs_to :coupon, foreign_key: true

      t.timestamps
    end
    add_index :discounts, :number
    add_index :discounts, :valid_till
    add_index :discounts, :active
  end
end
