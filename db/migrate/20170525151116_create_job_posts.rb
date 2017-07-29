class CreateJobPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :job_posts do |t|
      t.string :name, null: false, limit: 100
      t.string :location, null: false, limit: 100
      t.int4range :experience, null: false
      t.text :description, null: false
      t.text :skills, null:false
      t.boolean :active, null: false, default: false
      t.string :seo_meta_keywords, array: true, null: false
      t.string :seo_meta_description, null: false, limit: 150
      
      t.timestamps
    end
    add_index :job_posts, :name, unique: true
    add_index :job_posts, :location
    add_index :job_posts, :active
  end
end
