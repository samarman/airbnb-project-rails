class BookingsController < ApplicationController
  before_action :set_planet, only: [:create]

  def index
    @bookings = policy_scope(Booking)
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
    authorize @booking
    if @booking.destroy
      redirect_to bookings_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_bookings
    @bookings = current_user.bookings
    @next_booking = @bookings.select { |booking| booking.start_date >= Date.today }.sort_by(&:start_date).first
    @other_bookings = @bookings.select { |booking| booking.start_date > Date.today }.sort_by(&:start_date)
    @previous_bookings = @bookings.select { |booking| booking.end_date < Date.today }.sort_by(&:end_date)

    render 'my_bookings'
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
