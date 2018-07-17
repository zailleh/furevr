# == Schema Information
#
# Table name: operating_hours
#
#  id          :bigint(8)        not null, primary key
#  shelter_id  :bigint(8)
#  day_of_week :integer
#  open        :time
#  close       :time
#

class OperatingHour < ApplicationRecord
  belongs_to :shelter
 
  def day_of_week
    Date::DAYNAMES[read_attribute(:day_of_week)]
  end
 
  # If you want to set the day of week value with a string
  def day_of_week=(value)
    if value.class == Integer
      write_attribute(:day_of_week, value)
    else
      day = Date::DAYNAMES.index(value)
      if day.present?
        write_attribute(:day_of_week, day)
      else
        write_attribute(:day_of_week, 0)
      end
    end
  end
end
