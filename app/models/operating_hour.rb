class OperatingHour < ApplicationRecord
  belongs_to :shelter
 
  def day_of_week
    Date::DAY_NAMES[read_attribute(:day_of_week)]
  end
 
  # If you want to set the day of week value with a string
  def day_of_week=(value)
    day = Date::DAY_NAMES.index(value)
    write_attribute(:day_of_week, day) if day.present?
  end
end
