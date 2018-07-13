class AnimalType < ActiveRecord::Migration[5.2]
  def change
    rename_column :animal_types, :type, :type_name
  end
end
