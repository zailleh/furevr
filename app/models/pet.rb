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
#  shelter_id     :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  breed_id       :bigint(8)
#  description    :text
#  api_id         :bigint(8)
#

class Pet < ApplicationRecord

  belongs_to :animal_type
  belongs_to :shelter
  has_and_belongs_to_many :users
  has_many :pet_pics, :dependent => :destroy
  belongs_to :breed


  def age
    days = ((Date.today.mjd - read_attribute(:date_of_birth).mjd) / 365.25 * 2).ceil / 2.0

    days == days.to_i ? days.to_i : days
  end
end
