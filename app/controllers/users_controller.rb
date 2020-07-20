class UsersController < ApplicationController

  # what routes do I need for login?
  # route: render to them the login page
  get '/login' do
    erb :login
  end
  # what routes do I need for signup?
  get 'signup' do

  end



end
