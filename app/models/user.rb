class User < ApplicationRecord
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_one_attached :avatar

  has_many :likes
  has_many :comments
  has_many :replies

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(self.avatar, only_path: true) if self.avatar.attached?
  end
end