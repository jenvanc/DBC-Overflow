get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
  if @user
    login
    redirect '/'
  else
    @errors = ["Email/password does not match"]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end
