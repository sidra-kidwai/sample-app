class Post < ApplicationRecord

  default_scope {order(created_at: :desc)}
  
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  validates :title, :content, :category_id, presence: true


  accepts_nested_attributes_for :attachments, allow_destroy: true

  # def to_param
  #   title
  # end
end
