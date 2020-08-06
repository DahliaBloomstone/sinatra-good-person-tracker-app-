require './config/environment'

class ApplicationController < Sinatra::Base

  #configure do block 
  configure do
    set :public_folder, 'public' #relates to images in a public folder, telling sinatra this is where they live 
    set :views, 'app/views' #this is where sinatra is going to look when I render files 
    enable :sessions #access to a hash called session that we can manipulate 
    set :session_secret, "good_person_tracker" #session id created for particular session, extra layer of security 
    register Sinatra::Flash
  end

  get "/" do
  #  binding.pry
    if logged_in?
      redirect "/users/#{current_user.id}" # if user is logged in, their session will be saved in the app by their user id
    else
    erb :welcome # else, they are shown the welcome page 
  end
end

  helpers do

 def logged_in? # boolean reflection of an objects truthyness
   !!current_user
  end

  def current_user # return current user if there is one 
  @current_user ||= User.find_by(id: session[:user_id]) # find current user from the session hash. key value pair (user id) 
          # find_by queries the database. returns nil if there is not a key value pair that matches 
        # @current_user ||= (or equals) first time current user is referenced, instance variable will be created and assigned if the user is found by their id 
  end

def authorized_to_edit?(good_deed) #if the current user is authorized to edit, they can edit their own good deeds but not other users
  good_deed.user == current_user
    end

#HELPER METHOD FOR REDIRECTING IF NOT LOGGED IN
def redirect_if_not_logged_in
  if !logged_in?
    flash[:errors] = "You are not logged in!"
    redirect '/'
  end
end



  end
end
