class UsersController < ApplicationController

# what routes do I need for login?
# route: render the login page
  get '/login' do
    erb :login
  end

# creating a session (key, value pair to the session hash)
# receive the login form, find the user, log user in
  post '/login' do
    binding.pry
  end


# what routes do I need for signup?
  get 'signup' do

  end

end
