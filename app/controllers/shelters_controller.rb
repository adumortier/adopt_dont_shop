class SheltersController < ApplicationController

  def index 
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{params[:id]}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def shelterpets
    @shelter = Shelter.find(params[:shelter_id])
  end

  def deletepet
    Pet.destroy(params[:pet_id])
    redirect_to '/shelters/' + params[:shelter_id] + '/pets'
  end

  private 

  def shelter_params
    params.permit(:id, :name, :address, :city, :state, :zip)
  end

end