class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.date :available_from, null: false
      t.date :available_to, null: false
      t.belongs_to :discount, foreign_key: true
      t.belongs_to :coupon, foreign_key: true

      t.timestamps
    end
    add_index :offers, :available_from
    add_index :offers, :available_to
  end
end
