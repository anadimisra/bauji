class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.string :name, null: false, limit: 100, default: ""
      t.text :description, null: false, default: ""
      t.text :terms, null: false
      t.string :seo_meta_keywords, array: true, null: false
      t.string :seo_meta_description, null: false

      t.timestamps
    end
  end
end
