class GoodDeed < ActiveRecord::Base

#ActiveRecord Association 
  belongs_to :user

#human readable time
def formatted_created_at
  self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end

#user is able to create, read, update, and destroy the resource (good deed) that belongs_to the user
