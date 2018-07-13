class RemoveImageFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :image
  end
end
