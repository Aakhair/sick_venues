class Venue < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo
  geocoded_by :location
  CATEGORIES = ['badass wedding', 'intense ravers', 'crazy hippies', 'outdoor concert', 'epic birthday', 'messy graduation', 'dangerous corporate outing', 'unshitty family reunion', 'dog lovers']

  validates :category, inclusion: { in: CATEGORIES }
  validates :title, presence: true
  after_validation :geocode, if: :will_save_change_to_location?
end
