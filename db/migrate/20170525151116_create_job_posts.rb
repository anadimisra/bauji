class CreateJobPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :job_posts do |t|
      t.string :name, null: false, limit: 100, default: ""
      t.string :location, null: false, limit: 100, default: ""
      t.int4range :experience, null: false
      t.text :description, null: false
      t.text :skills, null:false
      t.boolean :active, null: false, default: false
      t.string :seo_meta_keywords, null: false
      t.string :seo_meta_description, null: false
      
      t.timestamps
    end
    add_index :job_posts, :name, unique: true
    add_index :job_posts, :location
    add_index :job_posts, :active
  end
end
