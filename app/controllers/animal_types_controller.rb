class AnimalTypesController < ApplicationController
  before_action :check_for_admin
  before_action :get_animal_type, :only => [:show, :edit, :update]

  def index
    @animal_types = AnimalType.all
  end

  def create
    @animal_type = AnimalType.create animal_type_params
    redirect_to animal_types_path
  end

  def new
    @animal_type = AnimalType.new
  end

  def destroy
    AnimalType.find(params[:id]).destroy
    redirect_to animal_types_path
  end

  def show
    
  end
  
  def edit
    
  end


  private
    def animal_type_params
      params.require(:animal_type).permit(:type_name)
    end

    def get_animal_type
      @animal_type = AnimalType.find(params[:id])
    end
end
