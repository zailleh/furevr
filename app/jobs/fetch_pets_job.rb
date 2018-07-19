class FetchPetsJob < ApplicationJob
  queue_as :default

  def fetch(api_url) 
    response =  HTTParty.get api_url, format: :plain
    JSON::parse response, symbolize_names: true
  end

  def perform
    api_url = ENV['FUREVR_API']
    
    # fetch main content of the pets api
    content = fetch api_url

    content.each do |p|
      #extract lookup data and create records where necessary
      animal_type = AnimalType.find_or_create_by :type_name => p[:type_name]
      breed = Breed.find_or_create_by :name => p[:breedPrimary]
      breed.animal_type_id = animal_type.id unless breed.animal_type_id.present?

      # create (or find an existing) pet and set details
      pet = Pet.find_or_create_by :api_id => p[:id]
      pet.name = p[:name]
      pet.colour = [p[:primary_colour],p[:secondary_colour]].join " / "
      pet.date_of_birth = p[:date_of_birth]
      pet.size = p[:size]
      pet.vacc_status = p[:isVaccinated]
      pet.description = p[:description1]

      # set related items
      pet.shelter = Shelter.first # Shelter.first just for testing TODO: Get shelters from API
      pet.animal_type = animal_type
      pet.breed = breed

      pet.save

      # fetch images for this pet from the API
      images = fetch "#{api_url}pets/#{p[:id]}"
      
      if images.kind_of? Array
        #add each image to the pet
        images.each do |img|
          pet.pet_pics.find_or_create_by :url => img[:image_path]
        end
      elsif images.present?
        pet.pet_pics.find_or_create_by :url => images[:image_path]
      end
    end # end each pet from api

    FetchPetsJob.set(wait: 1.hour).perform_later
  end
end
