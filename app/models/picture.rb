class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many :favorite_users, through: :favorites, source: :user
end
