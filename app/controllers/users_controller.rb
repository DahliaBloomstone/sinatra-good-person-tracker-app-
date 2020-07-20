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
    @user.authenticate(params[:password])
  end

# what routes do I need for signup?
  get 'signup' do

  end

end
