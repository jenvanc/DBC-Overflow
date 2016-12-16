get '/questions/:question_id/answers/:answer_id/comments/new' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  #redirect '/' unless authorized?(@question.user)
  erb :'comments/new_comment_answer'
end

get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  erb :'comments/new_comment_question'
end

post '/questions/:question_id/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new(content: params[:content], user: current_user, commentable_type: 'Answer', commentable_id: @answer.id)

  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new_comment_answer'
  end
end

post '/questions/:question_id/comments' do
 @question = Question.find(params[:question_id])
 @comment = Comment.new(content: params[:content], user: current_user, commentable_type: 'Question', commentable_id: @question.id)

 if @comment.save
   redirect "/questions/#{params[:question_id]}"
 else
   @errors = @comment.errors.full_messages
   erb :'comments/new_comment_question'
 end
end

get '/questions/:question_id/comments/:comment_id/edit' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:comment_id])
  redirect '/' unless authorized?(@comment.user)

  erb :'comments/edit'
end

put '/questions/:question_id/comments/:comment_id' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:comment_id])

  redirect '/' unless authorized?(@comment.user)

  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = ["Please fill in all fields"]
    erb :'comments/edit'
  end
end

get '/questions/:question_id/answers/:answer_id/comments/:comment_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.find(params[:comment_id])
  redirect '/' unless authorized?(@comment.user)

  erb :'/comments/edit'
end

put '/questions/:question_id/answers/:answer_id' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:comment_id])

  redirect '/' unless authorized?(@comment.user)

  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = ["Please fill in all fields"]
    erb :'comments/edit'
  end
end

delete '/questions/:question_id/comments/:comment_id' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:comment_id])
  redirect '/' unless authorized?(@comment.user)
  @comment.destroy
  redirect "/questions/#{@question.id}"
end

delete '/questions/:question_id/answers/:answer_id/comments/:comment_id' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.find(params[:comment_id])
  redirect '/' unless authorized?(@comment.user)
  @comment.destroy
  redirect "/questions/#{@question.id}"

end
