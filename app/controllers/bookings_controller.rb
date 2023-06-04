class BookingsController < ApplicationController
  before_action :set_planet, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.planet = @planet
    @booking.save
    redirect_to planet_path(@planet)
  end

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
