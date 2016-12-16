# Question Routes

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = current_user.id

  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  redirect '/' unless authorized?(@question.user)
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  redirect '/' unless authorized?(@question.user)

  @question.assign_attributes(params[:question])
  if @question.save
    redirect "/questions"
  else
    @errors = ["Please fill in all fields"]
    erb :'questions/edit'
  end
end

delete "/questions/:id" do
  question = Question.find(params[:id])
  redirect '/' unless authorized?(question.user)

  question.destroy
  redirect '/questions'
end
