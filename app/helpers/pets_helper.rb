module PetsHelper
  def search_helper
    cases = "000"
    cases[0] = params[:type].empty? ? "0" : "1"
    cases[1] = params[:breed].empty? ? "0" : "1"
    cases[2] = params[:state].empty? ? "0" : "1"

    case cases
    when "000"
      #empty search
      false
    when "100"
      #only type
      Pet.where(:animal_type_id => params[:type])
    when "010"
      #only breed
      Pet.where(:breed_id => params[:breed])
    when "001"
      #only state
      Pet.joins(:shelter).where( shelters: {:state => params[:state]})
    when "110"
      #type and breed only
      Pet.where(:animal_type_id => params[:type], :breed_id => params[:breed])
    when "101"
      #type and state only
      Pet.where(:animal_type_id => params[:type]).joins(:shelter).where( shelters: {:state => params[:state]})
    when "011"
      #breed and state only
      Pet.where(:breed_id => params[:breed]).joins(:shelter).where( shelters: {:state => params[:state]})
    when "111"
      #all params supplied
      Pet.where(:animal_type_id => params[:type], :breed_id => params[:breed]).joins(:shelter).where( shelters: {:state => params[:state]})
    end

    #will return the pets or show message
  end
end
