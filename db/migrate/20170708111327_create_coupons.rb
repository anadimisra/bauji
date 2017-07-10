class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code, null: false, limit: 8
      t.decimal :percentage, null: false, precision: 5, scale: 4
      t.decimal :max_value, null: false, precision: 6, scale: 2

      t.timestamps
    end
    add_index :coupons, :code, unique: true
    add_index :coupons, :percentage
    add_index :coupons, :max_value
  end
end
