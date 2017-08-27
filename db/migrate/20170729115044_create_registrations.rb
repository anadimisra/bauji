class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.belongs_to :learner, foreign_key: true
      t.belongs_to :workshop, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
