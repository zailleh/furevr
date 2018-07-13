# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

################################################################################
# Animal Types Lookup
User.destroy_all
Pet.destroy_all
Shelter.destroy_all

Breed.destroy_all
PetPic.destroy_all

AnimalType.destroy_all
ShelterType.destroy_all


at1 = AnimalType.create :type_name => "Cat"
at2 = AnimalType.create :type_name => "Dog"
at3 = AnimalType.create :type_name => "Ferret"
at4 = AnimalType.create :type_name => "Rabbit"

################################################################################
# Shelter Types Lookup


st1 = ShelterType.create :type_name => "Veterinary Practice"
st2 = ShelterType.create :type_name => "Veterinary Hospital"
st3 = ShelterType.create :type_name => "Animal Rescue"

################################################################################
# Breeds


at1.breeds.create :name => "Domestic Short-Hair"
at1.breeds.create :name => "Domestic Long-hair"
at1.breeds.create :name => "Domestic Medium-hair"
at1.breeds.create :name => "Maincoon"

at2.breeds.create :name => "Greyhound"
at2.breeds.create :name => "Boxer"

################################################################################
# Shelters


s1 = Shelter.create(
  :name           => "Nepean Animal Hospital", # :string
  :postcode       => "2745", # :string
  :address        => "50 Mulgoa Rd", # :string
  :suburb         => "Regentville", # :string
  :state          => "NSW", # :string
  :shelter_type_id => st2.id, # :integer
  :image          => "https://www.wellpet.com.au/wp-content/uploads/2015/11/NAH-Gallery-5-1024x768.,jpg", #text
  :url            => "http://www.wellpet.com.au/nepean-animal-hospital/", # :text
  :phone          => "02 4739 4011", # :string
  :email          => "reception@wellpet.com.au" # :string
)

s1.operating_hours.create(
  :day_of_week    => "Mon",  #:integer
  :open           => "00:00",  #:time
  :close          => "23:59"  #:time
)

s2 = Shelter.create(
  :name           => "Mountains Animal Hospital",
  :postcode       => "2774",
  :address        => "74 Murphy St",
  :suburb         => "Blaxland",
  :state          => "NSW",
  :shelter_type_id => st2.id,
  :image          => "https://www.wellpet.com.au/wp-content/uploads/2015/11/MAH.jpg",
  :phone          => "02 4739 4011",
  :email          => "reception@wellpet.com.au"
)

s2.operating_hours.create(
  :day_of_week    => "Mon" , #:integer
  :open           => "08:00" , #:time
  :close          => "19:00"  #:time
)

################################################################################
# Pets Create


p1 = Pet.create(
  :name           => "Slinky",     #string
  :date_of_birth  => "2016-06-10",      #date
  :animal_type_id  => at1.id,      #integer
  :colour         => "Black",      #string
  :size           => "Medium",      #string
  :vacc_status    => true,      #boolean
  :shelter_id     => s1.id,      #string
  :breed_id       => at1.breeds.first.id
)

p2 = Pet.create(
  :name          => "Narrikup",     #string
  :date_of_birth => "2018-04-10",      #date
  :animal_type_id => at1.id ,      #integer
  :colour        => "Brown",      #string
  :size          => "Small",      #string
  :vacc_status   => true,      #boolean
  :shelter_id    => s2.id,      #string
  :breed_id      => at1.breeds.last.id
)


p3 = Pet.create(
  :name          => "Angie",     #string
  :date_of_birth => "2013-04-10",      #date
  :animal_type_id => at2.id ,      #integer
  :colour        => "Black",      #string
  :size          => "Small",      #string
  :vacc_status   => true,      #boolean
  :shelter_id    => s2.id,      #string
  :breed_id      => at2.breeds.first.id
)


p4 = Pet.create(
  :name          => "Flash",     #string
  :date_of_birth => "2013-04-10",      #date
  :animal_type_id => at2.id ,      #integer
  :colour        => "Brown",      #string
  :size          => "Small",      #string
  :vacc_status   => true,      #boolean
  :shelter_id    => s2.id,      #string
  :breed_id      => at2.breeds.first.id
)

################################################################################
# Pet Pics

p1.pet_pics.create :url => "https://res.cloudinary.com/petrescue/image/upload/ar_1:1,c_fill,dpr_auto,f_auto,fl_lossy,g_face,q_auto,w_auto:100:500/v1531456420/gilinowew6zbjqkeg8pu.jpg"

p2.pet_pics.create :url => "https://cf.ltkcdn.net/cats/images/std/130974-283x424-theragamuffin.jpg"

p3.pet_pics.create :url => "https://www.gapnsw.com.au/wp-content/uploads/IMG_9972.jpg"

p4.pet_pics.create :url => "https://www.adoptapet.com.au/img/animals/4492632.jpeg"

################################################################################
# Users

u1 = User.create(
  :name             => "Admin", # :string
  :email            => "admin@nah.com", # :string
  :password         => "chicken", # :text
  :admin            => true, # :boolean
  :shelter_id       => s1.id # :integer
)

u2 = User.create(
  :name             => "Admin Mountains", # :string
  :email            => "mountains@nah.com", # :string
  :password         => "chicken", # :text
  :admin            => true, # :boolean
  :shelter_id       => s2.id # :integer
)

u3 = User.create(
  :name             => "Rick Sanchez", # :string
  :email            => "rick@sanches.com", # :string
  :password         => "chicken", # :text
  :admin            => false, # :boolean
  :shelter_id       => nil # :integer
)

################################################################################
# pets_users -- watch list

u3.pets << p1 << p3