class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :password_digest
      t.boolean :admin
      t.integer :shelter_id

      t.timestamps
    end
  end
end
