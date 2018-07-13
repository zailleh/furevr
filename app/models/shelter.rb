# == Schema Information
#
# Table name: shelters
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  postcode       :string
#  address        :string
#  suburb         :string
#  state          :string
#  sheltertype_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Shelter < ApplicationRecord
  has_many :pets
  belongs_to :shelter_type
  has_many :users
end
