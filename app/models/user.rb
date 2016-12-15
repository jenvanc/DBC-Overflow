class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  has_many :questions, :answers, :comments, :votes
end
