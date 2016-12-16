class Question < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :user, presence: true
  belongs_to :user
  belongs_to :best_answer, class_name: Answer, foreign_key: :best_answer_id
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable



end
