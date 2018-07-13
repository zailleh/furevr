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
#  image          :text
#  url            :text
#  phone          :string
#  email          :string
#

class Shelter < ApplicationRecord
  belongs_to :shelter_type
  
  has_many :pets
  has_many :users
  has_many :operating_hours, dependent: :destroy
end
