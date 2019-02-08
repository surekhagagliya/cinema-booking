class Screen < ApplicationRecord
  #Relationships
  belongs_to :manager
  has_one :movie, dependent: :destroy
  has_many :movie_shows, dependent: :destroy

end
