class FetchSheltersJob < ApplicationJob
  queue_as :default

  def fetch(api_url) 
    response =  HTTParty.get api_url, format: :plain
    JSON::parse response, symbolize_names: true
  end

  def perform
    api_url = ENV['FUREVR_API']
    shelters_url = "#{api_url}shelters"
    # fetch main content of the pets api
    content = fetch shelters_url

    content.each do |s|
      unless s[:shelter_id] == 0
        new_s = Shelter.find_or_initialize_by api_id: s[:shelter_id]
        new_s.name = s[:name]
        new_s.state = s[:state]
        new_s.phone = s[:phone]
        new_s.address = s[:address]
        new_s.shelter_type = ShelterType.find_by type_name: 'Animal Rescue'
        new_s.save
      end
    end # end each shelter from api

    FetchSheltersJob.set(wait: 1.day).perform_later
  end
end
