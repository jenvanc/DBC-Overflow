post '/votes' do
  vote = Vote.new(params[:vote])
  vote.user_id = current_user.id

  if params[:vote][:voteable_type] == "Answer"
    question_id = Answer.find(params[:vote][:voteable_id]).question.id
  else
    question_id = params[:vote][:voteable_id]
  end

  if vote.save
    if request.xhr?
      # binding.pry
      content_type :json
      total_points = vote.voteable.votes.count
      id = vote.voteable.id
      { points: total_points }.to_json
    else
      redirect "/questions/#{question_id}"
    end
  else
    @errors = ["You can only upvote once"]
    @question = Question.find(question_id)
    erb :"questions/show", layout: false
  end
end
