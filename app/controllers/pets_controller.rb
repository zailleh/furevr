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
    redirect_to @pet
  end

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.create pet_params
    redirect_to pet_path(@pet)

  end

  def destroy
    @pet.destroy
    redirect_to pets_path

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
