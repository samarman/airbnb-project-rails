class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show new create]
  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet.user = current_user
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planets_show_path(@planet)
    else
      render planets_new_path, status: :unprocessable_entity
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_planet
    @planet = planet.find(params[:id])
  end
end
