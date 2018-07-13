class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.belongs_to :animal_type, foreign_key: true

      t.timestamps
    end
  end
end
