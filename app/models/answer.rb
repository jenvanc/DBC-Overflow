class Answer < ActiveRecord::Base
  belongs_to :user, :question
  validates :content, :user, presence: true
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def is_favorite?
    self.question.best_answer == self
  end
end
