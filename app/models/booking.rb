class Booking < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :other_booking_overlap, on: [:create, :update]

  def total_price
    duration = (end_date - start_date).to_i
    price_per_night = planet.price_per_night
    total_price = duration * price_per_night
    total_price
  end

  def period
    start_date..end_date
  end

  private

  def other_booking_overlap
    # run this validation if the other ones did pass
    if errors.blank?
      other_bookings = planet.bookings
      overlapping_bookings = other_bookings.select do |other_booking|
        period.overlaps?(other_booking.period)
    end
      is_overlapping = !overlapping_bookings.empty?
      errors.add(:base, "Picked date is not available") if is_overlapping
    end
  end
end
