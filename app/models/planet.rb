class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependant: :destroy
  validates :name, :description, :price_per_night, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_address_and_description,
  against: [:planet, :address, :description], using: {
    tsearch: { prefix: true }
  }
end
