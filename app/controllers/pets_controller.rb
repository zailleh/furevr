class PetsController < ApplicationController
  before_action :check_for_shelter_admin, :only => [:create, :edit, :update, :destroy, :new]
  before_action :get_pet, :only => [:show, :edit, :destroy, :update, :watchlist,:watchlist_remove]
  before_action :check_for_login, :only => [:watchlist, :watchlist_remove]

  def watchlist
    @current_user.pets << @pet
    redirect_to @pet
  end

  def watchlist_remove
    @current_user.pets.delete @pet
    redirect_to request.referer
  end

  def search
    @pets = Pet.search params[:q]
  end

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
    @pet.shelter_id = @current_user.shelter_id
    @pet_pic = @pet.pet_pics.new
  end

  def edit
  end

  def create
    @pet = Pet.new pet_params
    @pet.shelter_id = @current_user.shelter_id
    @pet.save
    @pet.pet_pics.create :url => params[:pet][:pet_pics][:url] 

    redirect_to pet_path(@pet)

  end

  def destroy
    @pet.destroy
    redirect_to shelter_path(@current_user.shelter_id)
  end

  def update
    @pet.update pet_params
    redirect_to pets_path
  end

  private
  def pet_params
    params.require(:pet).permit(
      :name,
      :date_of_birth,
      :animal_type_id,
      :colour,
      :size,
      :vacc_status,
      :shelter_id,
      :breed_id
    )
  end

  def get_pet
    @pet = Pet.find params[:id]
  end
end
