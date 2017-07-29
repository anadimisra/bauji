class CreateLearners < ActiveRecord::Migration[5.1]
  def change
    create_table :learners do |t|
      t.string :email, null: false, limit: 100
      t.string :first_name, null: false, limit: 50
      t.string :middle_name, default: ""
      t.string :last_name, null: false, limit: 50
      t.string :phone_number, null: false, limit: 50
      t.string :company_name, null: false
      t.string :job_role, null: false, limit: 50
      t.text :certifications, default: ""

      t.timestamps
    end
    add_index :learners, :email, unique: true
    add_index :learners, :first_name
    add_index :learners, :middle_name
    add_index :learners, :last_name
    add_index :learners, :phone_number
    add_index :learners, :company_name
  end
end
