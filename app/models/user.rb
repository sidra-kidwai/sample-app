class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments
  has_one :attachment, as: :attachable, dependent: :destroy
  devise :omniauthable, omniauth_providers: %i[google_oauth2]

  accepts_nested_attributes_for :attachment, allow_destroy: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
