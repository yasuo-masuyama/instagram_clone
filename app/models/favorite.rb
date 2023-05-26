class Favorite < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :picture
end
