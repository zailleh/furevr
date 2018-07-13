# == Schema Information
#
# Table name: breeds
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  animal_type_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Breed < ApplicationRecord
  belongs_to :animal_type
  has_many :pets
end
