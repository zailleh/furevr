class FetchPetsJob < ApplicationJob
  queue_as :default
  def fetch(api_url) 
    response =  HTTParty.get api_url, format: :plain
    JSON::parse response, symbolize_names: true
  end

  def perform
    api_url = 'https://au-pet-api.herokuapp.com/'
    api_url = 'http://localhost:3000'
    content = fetch api_url

    content.each do |p|
      
      # TODO: Extract "lookup data"
      # type_name (eg 'cat')
      #  animal_type_id :integer
      #  shelter_id     :string
      #  breed_id       :bigint(8)
      animal_type = AnimalType.find_or_create_by :type_name => p[:type_name]
      breed = Breed.find_or_create_by :name => p[:breedPrimary]
      breed.animal_type_id = animal_type.id unless breed.animal_type_id.present?

      pet = Pet.find_or_create_by :api_id => p[:id]
      pet.name = p[:name]
      pet.colour = [p[:primary_colour],p[:secondary_colour]].join " / "
      pet.date_of_birth = p[:date_of_birth]
      pet.size = p[:size]
      pet.vacc_status = p[:isVaccinated]

      pet.shelter = Shelter.first

      pet.animal_type = animal_type
      pet.breed = breed

      pet.save

    end
  end
end
