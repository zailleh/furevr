# == Schema Information
#
# Table name: shelter_types
#
#  id        :bigint(8)        not null, primary key
#  type_name :text
#

class ShelterType < ApplicationRecord
  has_many :shelters
end
