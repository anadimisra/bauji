class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.string :venue, limit: 50, default: ""
      t.string :city, null: false, limit: 50
      t.string :country, null: false, limit: 30, default: "India"
      t.string :venue_map_link
      t.text :description
      t.date :starts_on, null: false
      t.date :ends_on, null: false
      t.time :starts_at, null: false
      t.time :ends_at, null: false
      t.integer :seats, null: false, default: 25
      t.decimal :ticket_price, null: false, precision: 9, scale: 2, default: 35000.00
      t.string :seo_meta_keywords, array: true, null: false
      t.string :seo_meta_description, null: false
      t.belongs_to :certification, foreign_key: true

      t.timestamps
    end
    add_index :workshops, :city
    add_index :workshops, :country
    add_index :workshops, :starts_on
    add_index :workshops, :ends_on
    add_index :workshops, :ticket_price
  end
end
