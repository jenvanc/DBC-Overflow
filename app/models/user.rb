class User < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_secure_password
  validates :password, {length: 6..20}
end
