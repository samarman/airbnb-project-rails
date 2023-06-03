class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show]
  def index
    @planets = Planet.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render new_planet_path, status: :unprocessable_entity
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_planet
    @planet = Planet.find(params[:id]) if params[:id].present?
  end
end
