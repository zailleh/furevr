class CreatePetPics < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_pics do |t|
      t.text :url
      t.belongs_to :pet, foreign_key: true, index: true

      t.timestamps
    end
  end
end
