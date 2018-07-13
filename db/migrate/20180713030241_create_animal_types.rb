class CreateAnimalTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_types do |t|
      t.text :type
    end
  end
end
