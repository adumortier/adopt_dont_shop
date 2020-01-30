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
    info = { :name => params[:shelter][:name], 
      :address => params[:shelter][:address], 
      :city => params[:shelter][:city], 
      :state => params[:shelter][:state], 
      :zip => params[:shelter][:zip]} 
      shelter = Shelter.create(info)
      shelter.save
      redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    info = { :name => params[:name], 
      :address => params[:address], 
      :city => params[:city], 
      :state => params[:state], 
      :zip => params[:zip]} 
    shelter.update(info)
    shelter.save
    redirect_to "/shelters/#{params[:id]}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters/'
  end

end