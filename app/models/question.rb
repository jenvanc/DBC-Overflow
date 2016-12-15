class Question < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: Answer
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
