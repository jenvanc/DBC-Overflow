class Question < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :answers
  belongs_to :best_answer, class_name: Answer, foreign_key: :best_answer_id
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end


jenna = User.create(username: 'jenna', email: 'j@e.com', password_digest: 'password')
question1 = Question.new(title: 'hey', content: 'hey', user_id: 1)
answer1 = Answer.new(content: 'hello', user_id: 1, question_id: 1)
