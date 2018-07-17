class ChangeShelterIdToIntOnPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :shelter_id, 'bigint USING CAST(shelter_id AS bigint)'
  end
end
