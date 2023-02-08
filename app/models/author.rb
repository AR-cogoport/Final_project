class Author < ApplicationRecord
    has_secure_password
    # validates :name, presence: true
    validates :password, presence: true
    has_many :articles ,dependent: :destroy
    # mount_uploader :avatar, AvatarUploader
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, uniqueness: true
    validates :password,
    length: { minimum: 6 },
    if: -> { new_record? || !password.nil? }
end
