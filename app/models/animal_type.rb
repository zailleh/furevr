# == Schema Information
#
# Table name: animal_types
#
#  id         :bigint(8)        not null, primary key
#  type_name  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnimalType < ApplicationRecord
  has_many :pets
end
