require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "good_person_tracker"
  end

  get "/" do
    erb :welcome
  end

  helpers do

 def logged_in? #boolean reflection of an objects truthyness
   !!current_user
  end

  def current_user
  @current_user ||= User.find_by(id: session[:user_id])
    end

  end

end
