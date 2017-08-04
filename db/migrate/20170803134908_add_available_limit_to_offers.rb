class AddAvailableLimitToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :available_limit, :integer, null: false, default: 5
    add_index :offers, :available_limit
  end
end
