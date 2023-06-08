class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :description, :price_per_night, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
end
