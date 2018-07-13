# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

################################################################################
# Animal Types Lookup

AnimalType.destroy_all


AnimalType.create :type_name => "Cat"
AnimalType.create :type_name => "Dog"
AnimalType.create :type_name => "Ferret"
AnimalType.create :type_name => "Rabbit"

################################################################################
# Shelter Types Lookup

ShelterType.destroy_all

ShelterType.create :type_name => "Veterinary Practice"
ShelterType.create :type_name => "Veterinary Hospital"
ShelterType.create :type_name => "Animal Rescue"

################################################################################
# Shelters

Shelter.destroy_all

Shelter.create(
  :name           => "Nepean Animal Hospital",
  :postcode       => "2745",
  :address        => "50 Mulgoa Rd",
  :suburb         => "Regentville",
  :state          => "NSW",
  :sheltertype_id => "2",
  :image          => "https://www.wellpet.com.au/wp-content/uploads/2015/11/NAH-Gallery-5-1024x768.,jpg"
  :url            => "http://www.wellpet.com.au/nepean-animal-hospital/"
)

Shelter.create(
  :name           => "WellPet - Mountains"
  :postcode       => ""
  :address        => ""
  :suburb         => ""
  :state          => ""
  :sheltertype_id => ""
  :image          => "https://www.wellpet.com.au/wp-content/uploads/2015/11/MAH.jpg"
)

Shelter.create(
  :name           => ""
  :postcode       => ""
  :address        => ""
  :suburb         => ""
  :state          => ""
  :sheltertype_id => ""
  :image          => ""
)