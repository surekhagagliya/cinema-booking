class MovieShow < ApplicationRecord
  #relationships
  belongs_to :screen
  has_many :seat_booking, dependent: :destroy
end
