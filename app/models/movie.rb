class Movie < ApplicationRecord
  belongs_to :manager
  has_many :actors, dependent: :destroy
end
