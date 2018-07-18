class AddApiIdToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :api_id, :bigint
  end
end
