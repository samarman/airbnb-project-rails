class Planet < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price_per_night, presence: true
  validates :name, uniqueness: true
end
