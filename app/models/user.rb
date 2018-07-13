class User < ApplicationRecord
  has_and_belongs_to_many :pets
  belongs_to :shelter
end
