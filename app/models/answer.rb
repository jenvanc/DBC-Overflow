class Answer < ActiveRecord::Base
  belongs_to :user, :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  validates :content, :user, presence: true

  def is_favorite?
    self.question.best_answer == self
  end
end
