class UsersController < ApplicationController

# what routes do I need for login?
# route: render the login page
  get '/login' do
    erb :login
  end

# creating a session (key, value pair to the session hash)
# receive the login form, find the user, log user in
# Steps: Find user, authenticate user, log in user, redirect to user landing page
  post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id #actually logging the user in
    puts session
    redirect "users/#{@user.id}"
  else

    end
  end

# what routes do I need for signup?
# this route's job is to render the signup form
# erb to render a view
  get '/signup' do
    erb :signup
  end

  post '/users' do
    
  end

# show route
  get '/users/:id' do
    "user show route"
  end

end
