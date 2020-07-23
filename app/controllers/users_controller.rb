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
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id #actually logging the user in
    puts session
    flash[:message] = "Hello There, #{@user.name}!"
    redirect "users/#{@user.id}"
  else
    flash[:errors] = "Invalid Login! Sign up or try again!"
    redirect '/login'
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
    @user = User.new(params) # new vs create. create=saves/persists in database. new=instantiates new object.
  if @user.save
    session[:user_id] = @user.id #logging user in
    redirect "/users/#{@user.id}" #redirect - url - new get/http request; interpolate
flash[:message] = "Welcome new user, #{@user.name}! You have a new good person tracker account!"
  else
    # binding.pry
    # => {"name"=>"", "email"=>"ooo", "password"=>""}
    flash[:errors] = "Failed to create a new account: #{@user.errors.full_messages.to_sentence} :("
    #not a valid input
    redirect '/signup'
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
