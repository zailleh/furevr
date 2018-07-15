class ShelterTypesController < ApplicationController
  before_action :check_for_admin
  before_action :get_shelter_type, :only => [:destroy, :show, :edit, :update]

  def index
    @shelter_types = ShelterType.all
  end

  def create
  end

  def new
  end

  def destroy
    @shelter_type.destroy
    redirect_to shelter_types_path
  end

  def show
  end

  private
  def get_shelter_type
    @shelter_type = ShelterType.find params[:id]
  end

  def shelter_type_params
    params.require(:shelter_type).permit(:type_name)
  end

end
