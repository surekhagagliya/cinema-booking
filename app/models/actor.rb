class Actor < ApplicationRecord
  #relationships
  belongs_to :movie
  has_one_attached :actor_image
end
