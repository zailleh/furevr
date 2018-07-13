class User < ApplicationRecord
  has_secure_password #bcrypt gem
  validates :email, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :pets
  belongs_to :shelter
end
