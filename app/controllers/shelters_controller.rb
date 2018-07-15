class SheltersController < ApplicationController

  before_action :get_shelter, :only => [:show, :edit, :update]
  before_action :check_for_shelter_admin, :only => [:edit, :update]
  before_action :check_for_admin, :only => [:new, :create]
  
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

  def get_shelter
    @shelter = Shelter.find params[:id]
  end

  def check_for_shelter_admin
    unless @current_user.present? && @current_user.shelter == @shelter
      redirect_to shelters_path
    end
  end
end
