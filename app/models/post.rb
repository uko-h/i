class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
