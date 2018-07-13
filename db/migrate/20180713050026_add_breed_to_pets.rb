class AddBreedToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :breed_id, :bigint
  end
end
