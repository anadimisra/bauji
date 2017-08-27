class CreateWorkshopOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :workshop_offers do |t|
      t.belongs_to :offer, foreign_key: true
      t.belongs_to :workshop, foreign_key: true

      t.timestamps
    end
  end
end
