class Post < ApplicationRecord
  belong_to :category
  validates :title, :content, :category_id, presence: true
end
