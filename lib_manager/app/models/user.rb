class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :comments
  has_many :borrows

  has_many :relationships, as: :ownerable
  has_many :following_books, through: :relationships,
    source_type: Book.name, source: :targetable
  has_many :following_authors, through: :relationships,
    source_type: Author.name, source: :targetable

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "ownerable_id", dependent: :destroy
  has_many :following_users, through: :active_relationships,
    source_type: User.name, source: :targetable

  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "targetable_id", dependent: :destroy
  has_many :follower_users, through: :passive_relationships,
    source_type: User.name, source: :ownerable

  before_save :downcase_email

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
