# Create Users
  20.times do
    username = Faker::Internet.user_name
    email = Faker::Internet.email
    password = Faker::Internet.password
    User.create(username: username, email: email, password: password)
  end

# Create Questions
20.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.paragraph(4)
  user = User.all.sample.id
  Question.create!(title: title, content: content, user_id: user)
end

# Create Answers
75.times do
  user = User.all.sample.id
  question = Question.all.sample.id
  content = content = Faker::Lorem.paragraph(2)
  Answer.create!(content: content, user_id: user, question_id: question)
end

# Create Answer Votes
20.times do
  user = User.all.sample.id
  voteable_id = Answer.all.sample.id
  voteable_type = Answer
  Vote.find_or_create_by(user_id: user, voteable_id: voteable_id, voteable_type: voteable_type)
end

# Create Question Votes
20.times do
  user = User.all.sample.id
  voteable_id = Question.all.sample.id
  voteable_type = Question
  vote = Vote.find_or_create_by(user_id: user, voteable_id: voteable_id, voteable_type: voteable_type)
end

# Create Answer Comments
100.times do
  content = Faker::Lorem.paragraph(2)
  user = User.all.sample.id
  commentable_id = Answer.all.sample.id
  commentable_type = Answer
  Comment.create!(content: content, user_id: user, commentable_id: commentable_id, commentable_type: commentable_type)
end

# Create Question Comments
100.times do
  content = Faker::Lorem.paragraph(2)
  user = User.all.sample.id
  commentable_id = Question.all.sample.id
  commentable_type = Question
  Comment.create!(content: content, user_id: user, commentable_id: commentable_id, commentable_type: commentable_type)
end

# Add best answers
Question.all.each { |question| question.update_attributes(best_answer: question.answers.sample)}
