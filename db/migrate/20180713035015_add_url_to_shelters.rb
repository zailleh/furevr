class AddUrlToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :url, :text
  end
end
