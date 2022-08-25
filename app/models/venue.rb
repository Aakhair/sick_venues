class Venue < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :reservations
  has_one_attached :photo
  geocoded_by :location
  CATEGORIES = ['badass wedding', 'intense ravers', 'crazy hippies', 'outdoor concert', 'epic birthday', 'messy graduation', 'dangerous corporate outing', 'unshitty family reunion', 'dog lovers']

  validates :category, inclusion: { in: CATEGORIES }
  validates :title, presence: true
  after_validation :geocode, if: :will_save_change_to_location?


end
