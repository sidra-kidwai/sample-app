class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, :content, :category_id, presence: true
  mount_uploader :picture, PictureUploader
end
