class ShelterType < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelter_types, :type, :type_name
  end
end
