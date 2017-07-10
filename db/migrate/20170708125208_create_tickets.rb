class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :registration_id
      t.string :payment_gateway
      t.string :payment_gateway_transaction_id
      t.decimal :offer_price
      t.decimal :sale_price
      t.string :status
      t.references :workshop, foreign_key: true
      t.references :learner, foreign_key: true
      t.references :discount, foreign_key: true
      
      t.timestamps
    end
    add_index :tickets, :registration_id, unique: true
    add_index :tickets, :status
  end
end
