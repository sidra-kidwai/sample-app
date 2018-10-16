class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :commentable
  validates :title, :content, :category_id, presence: true
end
