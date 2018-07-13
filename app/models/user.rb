# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  password_digest :text
#  admin           :boolean
#  shelter_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#

class User < ApplicationRecord
  has_secure_password #bcrypt gem
  validates :email, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :pets
  belongs_to :shelter, :optional => true
end
