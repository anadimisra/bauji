class CreateLearners < ActiveRecord::Migration[5.1]
  def change
    create_table :learners do |t|
      t.string :email, null: false, limit: 50
      t.string :first_name, null: false, limit: 30
      t.string :middle_name, limit: 30
      t.string :last_name, null: false 
      t.string :mobile, null: false, limit: 10
      t.string :country_code, null: false, limit: 3
      t.string :company, null: false, limit: 50
      t.string :job_role, limit: 30   

      t.timestamps
    end
    add_index :learners, :email, unique: true
    add_index :learners, :first_name
    add_index :learners, :middle_name
    add_index :learners, :last_name
    add_index :learners, :mobile
    add_index :learners, :country_code
    add_index :learners, :company
  end
end
