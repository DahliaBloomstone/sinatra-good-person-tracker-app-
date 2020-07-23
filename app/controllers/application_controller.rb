require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "good_person_tracker"
    register Sinatra::Flash 
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
  end
end

  helpers do

 def logged_in? #boolean reflection of an objects truthyness
   !!current_user
  end

  def current_user
  @current_user ||= User.find_by(id: session[:user_id])
  end

def authorized_to_edit?(good_deed)
  good_deed.user == current_user
    end

#HELPER METHOD FOR REDIRECTING IF NOT LOGGED IN

  end
end
