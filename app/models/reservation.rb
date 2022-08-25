class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :date, uniqueness: { scope: :venue }

  def unavailable_dates
    reservations.pluck(:date).map do |range|
      { from: range[0], to: range[1] }
    end
end
