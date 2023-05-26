class Picture < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many :favorite_users, through: :favorites, source: :user
end
