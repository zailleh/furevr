class CreateOperatingHours < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_hours do |t|
      t.belongs_to :shelter, index: true
      t.integer :day_of_week
      t.time :open
      t.time :close
    end
  end
end
