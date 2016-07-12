class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    validates :region, length: { maximum: 20 }
    validates :description, length: { maximum: 255 }
    VALID_EMAIL_REGEX = /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_URL_REGEX = /\Ahttps?\:\/\/[a-z\d\-\.\/]+/i
    validates :url, format: { with: VALID_URL_REGEX }, allow_blank: true
    has_secure_password
end
