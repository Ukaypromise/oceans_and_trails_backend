class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :user, presence: true
  validates :tour, presence: true
end
