# == Schema Information
#
# Table name: pet_pics
#
#  id         :bigint(8)        not null, primary key
#  url        :text
#  pet_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PetPic < ApplicationRecord
  belongs_to :pet
end
