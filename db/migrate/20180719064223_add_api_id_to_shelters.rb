class AddApiIdToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :api_id, :bigint
  end
end
