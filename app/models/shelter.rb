class Shelter < ApplicationRecord
  has_many :pets
  belongs_to :shelter_type
  has_many :users
end
