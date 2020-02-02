class PetsController < ApplicationController

  def index 
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    info = Pet.valid_input(pet_params)
    info[:status] = 'adoptable'
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(info)
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{params[:id]}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

    private

    def pet_params
      params.permit(:name, :image, :description, :age, :sex)
    end

end