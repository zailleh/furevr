class CreateShelterTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :shelter_types do |t|
      t.text :type
    end
  end
end
