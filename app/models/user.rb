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
    has_many :microposts
    
    has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :following_users, through: :following_relationships, source: :followed
    
    has_many :follower_relation_ships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :follower_users, through: :follower_relation_ships, source: :follower
    
    def follow(other_user)
        following_relationships.find_or_create_by(followed_id: other_user.id)
    end
    
    def unfollow(other_user)
        following_relationship = following_relationships.find_or_create_by(followed_id: other_user.id)
        following_relationship.destroy if following_relationship
    end
    
    def following?(other_user)
        following_users.include?(other_user)
    end
end
