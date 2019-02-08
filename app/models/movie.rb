class Movie < ApplicationRecord
  #relationships
  belongs_to :manager
  has_many :actors, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :screen

  #active storage for image Upload\
  has_one_attached :image
  has_one_attached :cover_image


  #validations
  validates :name, :image, :cover_image, presence: true
end
