# == Schema Information
#
# Table name: pets
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  date_of_birth  :date
#  animal_type_id :integer
#  colour         :string
#  size           :string
#  vacc_status    :boolean
#  shelter_id     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  breed_id       :bigint(8)
#

class Pet < ApplicationRecord
  belongs_to :animal_type
  belongs_to :shelter
  has_and_belongs_to_many :users
  has_many :pet_pics
  belongs_to :breed
end
