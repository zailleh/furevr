class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :animaltype_id
      t.string :colour
      t.string :size
      t.boolean :vacc_status
      t.string :shelter_id

      t.timestamps
    end
  end
end
