class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :gateway_transaction_id
      t.decimal :order_value, null: false, precision: 9, scale: 2
      t.belongs_to :offer, foreign_key: true

      t.timestamps
    end
    add_index :orders, :order_id, unique: true
    add_index :orders, :order_value
  end
end