class SheltersController < ApplicationController

  before_action :get_shelter, :only => [:show, :edit, :update, :hours, :update_hours]
  before_action :check_for_shelter_admin, :only => [:edit, :update, :hours]
  before_action :check_for_admin, :only => [:new, :create]

  def hours
    @hours = @shelter.operating_hours.order(:day_of_week)
    if @hours.length < 7
      days = @shelter.operating_hours.pluck(:day_of_week)
      # not all hours populated
      for i in (0).upto(6)
        @shelter.operating_hours.create :day_of_week => i unless days.include? i
      end
    end
    @hours = @shelter.operating_hours.order(:day_of_week).rotate
  end
  
  def update_hours
    hours_params.keys.each do |day|
      day_num = Date::DAYNAMES.index(day.capitalize)
      @shelter.operating_hours.find_by(day_of_week: day_num).update hours_params[day]
    end
    
    # raise 'hell'

    redirect_to @shelter
  end

  def show
  end

  def index
    @shelters = Shelter.all
  end

  def edit
  end

  def update
    @shelter.update shelter_params
    redirect_to @shelter
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.create shelter_params
    redirect_to @shelter
  end


  private

  def shelter_params
    params.require(:shelter).permit(
      :name, 
      :postcode,
      :address,
      :suburb,
      :state,
      :shelter_type_id,
      :image,
      :url,
      :phone,
      :email
    )
  end

  def hours_params
    params.require(:hours).permit(
      :monday => {},
      :tuesday => {},
      :wednesday => {},
      :thursday => {},
      :friday => {},
      :saturday => {},
      :sunday => {}
    )
  end

  def get_shelter
    @shelter = Shelter.find params[:id]
  end

  def check_for_shelter_admin
    unless @current_user.present? && @current_user.shelter == @shelter
      redirect_to shelters_path
    end
  end
end
