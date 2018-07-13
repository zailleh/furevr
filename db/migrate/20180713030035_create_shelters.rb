class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :postcode
      t.string :address
      t.string :suburb
      t.string :state
      t.integer :sheltertype_id

      t.timestamps
    end
  end
end
