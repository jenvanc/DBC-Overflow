class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :user, presence: true
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
end
