class FixShelterTypeIdColumnOnShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :sheltertype_id, :shelter_type_id
  end
end
