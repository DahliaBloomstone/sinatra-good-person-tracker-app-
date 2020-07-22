class GoodDeedsController < ApplicationController

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
    @good_deed = GoodDeed.create(content: params[:content], user_id: current_user.id)
    redirect "/good_deeds/#{@good_deed.id}"
  else
    redirect '/good_deeds/new'
  end
end

# show route for a good deed entry
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
  erb :'/good_deeds/edit'
end

# This actiion's job is to...
# Find the Good Deed Entry
# Modify the/update the entry
# Where to go / redirect to show page
patch '/good_deeds/:id' do
set_good_deed_entry
end
# index route for all good deeds

private #something we're not gonna call anywhere else
def set_good_deed_entry
  @good_deed = GoodDeed.find(params[:id])
  end

end
