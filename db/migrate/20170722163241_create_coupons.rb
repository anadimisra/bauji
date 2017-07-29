class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :name, null: false
      t.string :voucher_code, null: false

      t.timestamps
    end
    add_index :coupons, :voucher_code, unique: true
  end
end
