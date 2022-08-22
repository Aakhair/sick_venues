class Venue < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :title, presence: true
end
