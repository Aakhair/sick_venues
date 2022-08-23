class Venue < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

  validates :title, presence: true
end
