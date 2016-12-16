class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  validates :content, :user, presence: true

  def make_favorite(best_answer_id)
    self.update_attributes(best_answer_id: best_answer_id)
  end
  def is_favorite?
    self.question.best_answer == self
  end

end
