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
    # binding.pry
    # create a new user and persist the new user to the database
    # params will look like: => {"name"=>"Poop", "email"=>"Poop@gmail.com", "password"=>"password "}
  if params[:name] != "" && params[:email] != "" && params[:password] != ""
    @user = User.create(params)
    redirect "/users/#{@user.id}" #redirect - url - new get/http request; interpolate
  else
    #not a valid input
    end
  end


#user SHOW route
# /:id telling sinatra piece of URL is going to be dynamic, will change from one user to another
# id = key in the params hash
  get '/users/:id' do
    # raise params.inspect
    @user = User.find_by(id: params[:id])
     # ex: binding.pry => params => {"id"=>"4"}
    erb :'/users/show' #file path
  end

get '/logout' do
  session.clear
  redirect '/'
  end


end
