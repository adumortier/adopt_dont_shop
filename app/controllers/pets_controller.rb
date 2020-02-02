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
    info = {  :name => params[:name], 
              :image => params[:image], 
              :description => params[:description], 
              :age => params[:age], 
              :sex => params[:sex],
              :status => 'adoptable'
            } 
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(info)
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    info = {  :name => params[:name], 
              :image => params[:image], 
              :description => params[:description], 
              :age => params[:age], 
              :sex => params[:sex],
              :status => 'adoptable'
            } 
    pet = Pet.find(params[:id])
    pet.update(info)
    pet.save
    redirect_to "/pets/#{params[:id]}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

end