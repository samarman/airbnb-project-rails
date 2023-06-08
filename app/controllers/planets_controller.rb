class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update]
  def index
    @planets = policy_scope(Planet)
    # @planets = Planet.all
  end

  def show
    authorize(@planet)
    @booking = Booking.new
  end

  def new
    @planet = Planet.new
    authorize @planet
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    authorize @planet
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render new_planet_path, status: :unprocessable_entity
    end
  end

  def edit
    authorize(@planet)
  end

  def update
    authorize(@planet)
    @planet.update(planet_params)
    redirect_to planet_path(@planet)
  end

  def destroy
    @planet = Planet.find(params[:id])
    authorize @planet
    if @planet.destroy
      redirect_to planets_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :address, :description, :price_per_night, :number_of_guests, :photo)
  end

  def set_planet
    @planet = Planet.find(params[:id])
  end
end
