class GoodDeedsController < ApplicationController
  #binding.pry self.class => GoodDeedsController
  #a route is simply an HTTP method/verb that is paired with a URL-matching pattern

get '/good_deeds' do
  @good_deeds = GoodDeed.all #instance variable to access the corresponding view
  erb :'good_deeds/index' #file reference vs redirect which is a route
end

# get good_deeds/new to render a form to create a new entry
get '/good_deeds/new' do
  erb :'/good_deeds/new'
end

# post good_deeds to create a new good deed
# create a new journal entry and save it to the database
# only save entry if there is content
# only create entry if user is logged in
post '/good_deeds' do
  if !logged_in?
    redirect '/'
end
  if params[:content] != ""
    #create new entry
    flash[:message] = "Good deed successfully created!"
    @good_deed = GoodDeed.create(content: params[:content], user_id: current_user.id)
    redirect "/good_deeds/#{@good_deed.id}"
  else
    flash[:errors] = "You didn't type anything! Stupid idiot! Enter content! :("
    redirect '/good_deeds/new'
  end
end

# show route for a good deed entry
# dynamic route :
# sinatra matches a request to a specific controller action
# ex: 1 is an id parameter that is being passed into the path 
get '/good_deeds/:id' do
set_good_deed_entry
# binding.pry
# params  => {"id"=>"3"}
# @good_deed => id: 3, content: "I donated more money!", user_id: 1,
  erb :'/good_deeds/show'
end

# route should send us to good_deeds/edit.erb
# render an edit form
get '/good_deeds/:id/edit' do
  set_good_deed_entry
  redirect_if_not_logged_in
  if authorized_to_edit?(@good_deed)
    erb :'/good_deeds/edit'
  else
    redirect "users/#{current_user.id}"
  end
end

# This action's job is to...
# Find the Good Deed Entry
# Modify the/update the entry
# Where to go / redirect to show page
patch '/good_deeds/:id' do
set_good_deed_entry
redirect_if_not_logged_in
  if @good_deed.user == current_user && params[:content] != ""
    @good_deed.update({content: params[:content]}) #hash
    redirect "/good_deeds/#{@good_deed.id}"
  else
    redirect "users/#{current_user.id}"
  end
end
# binding.pry
# in browser: http://167.99.15.173:44406/good_deeds/1/edit, =>  {"_method"=>"patch","content"=>"I recycled.\" only a little bit though.", "id"=>"1"}
# Added the ability to edit an entry:
delete '/good_deeds/:id' do
  set_good_deed_entry
  if authorized_to_edit?(@good_deed) # users can edit and delete only their own good deeds
    @good_deed.destroy
    flash[:message] = "Yay! You deleted your good deed entry"
    #delete the entry, go somewhere..redirect. Why redirect? separation of concerns
    redirect '/good_deeds'
  else
  #  flash[:errors] = "You didn't delete your entry! :("
      #go somewhere else not deleted
      redirect '/good_deeds '
  end
end

private #something we're not gonna call anywhere else
def set_good_deed_entry
  @good_deed = GoodDeed.find(params[:id])
  end

end
