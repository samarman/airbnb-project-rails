class Booking < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :start_date, :end_date, presence: true

  def total_price
    duration = (end_date - start_date).to_i
    price_per_night = planet.price_per_night
    total_price = duration * price_per_night
    total_price
  end
end
