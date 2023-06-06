class BookingsController < ApplicationController
  before_action :set_planet, only: [:create]

  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.planet = @planet
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking, :destroy?
    @booking.destroy

    redirect_to bookings_path, status: :see_other
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
