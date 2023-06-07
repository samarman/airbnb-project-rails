class Booking < ApplicationRecord
   belongs_to :planet
  belongs_to :user

  validates :start_date, :end_date, presence: true

  def total_price
    price = planet.price_per_night * (end_date - start_date).to_i
    return "#{price}£"
  end
end
