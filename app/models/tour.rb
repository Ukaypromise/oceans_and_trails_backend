class Tour < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :tourName, presence: true
  validates :picture, presence: true
  validates :description, presence: true
end
