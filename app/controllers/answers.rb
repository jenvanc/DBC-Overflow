get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  redirect '/' unless authorized?(@question.user)
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = Answer.new(content: params[:content], user: current_user, question: @question)
  if @answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end
end
