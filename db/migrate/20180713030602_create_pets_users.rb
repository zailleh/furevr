class CreatePetsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :pets_users do |t|
      t.integer :pet_id
      t.integer :user_id
    end
  end
end
