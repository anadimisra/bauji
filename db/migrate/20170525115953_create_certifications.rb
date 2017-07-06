class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.string :name, null: false, limit: 100, default: ""
      t.string :city, null: false, limit: 100, default: ""
      t.string :venue, null: false, limit: 100, default: ""
      t.daterange :dates, null: false
      t.tsrange :schedule, null: false
      t.integer :seats, null: false, default: 30
      t.decimal :unit_price, null: false, precision: 9, scale: 2, default: 42499.00
      t.string :venue_map_link, null: false
      t.string :description, limit: 250, null: false, default: ""
      t.text :terms, null: false
      t.string :seo_meta_keywords, array: true, null: false
      t.string :seo_meta_description, null: false

      t.timestamps
    end
    add_index :certifications, :name
    add_index :certifications, :city
    add_index :certifications, :dates
    add_index :certifications, :schedule
    add_index :certifications, :seats
  end
end