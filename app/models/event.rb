class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :attendees, through: :bookings, source: :user

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :event_date, presence: true
  validates :max_participants, presence: true, numericality: { greater_than: 0 }

  def full?
    bookings.count >= max_participants
  end

  def available_spots
    max_participants - bookings.count
  end
end
