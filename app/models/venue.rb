class Venue < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo
  CATEGORIES = ['badass wedding', 'intense ravers', 'crazy hippies', 'outdoor concert', 'epic birthday', 'messy graduation', 'dangerous corporate outing', 'unshitty family reunion', 'dog lovers']

  validates :title, presence: true
end
