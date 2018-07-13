class RenameAnimaltypeIdToAnimalTypeIdForPets < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :animaltype_id, :animal_type_id
  end
end
