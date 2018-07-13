class Pet < ApplicationRecord
  belongs_to :animal_type
  belongs_to :shelter
  has_and_belongs_to_many :users
end
