class Manager < ApplicationRecord

  #associations
  has_one :profile, dependent: :destroy
  has_many :screens, dependent: :destroy
  has_many :movies, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
