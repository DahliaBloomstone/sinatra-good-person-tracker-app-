Specifications for the Sinatra Assessment
Specs:

 x Use Sinatra to build the app
      I am using Sinatra. The gem has been installed and required for this project!

 x Use ActiveRecord for storing information in a database
      Used ActiveRecord. I used AR to store instances of the model classes in the database. All models are connected via ActiveRecord::Base.

 x Include more than one model class (e.g. User, Post, Category)
      There are two models: good_deed and user.

 x Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Good deeds belongs to user, User has many good deeds.

 x Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Good deeds belongs to user, user has many good deeds.

 x Include user accounts with unique login attribute (username or email)
    Users can sucessfully sign up for an account and login to their account.

 x Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        CRUD routes were used.

x Ensure that users can't modify content created by other users
    Using sessions, the user's ID is maintained and any content created by someone with a different user ID is not editable/removable

x Include user input validations

 x BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    There are a number of flash messages displayed to the user.
    The README.md is updated.

Commits:

x You have a large number of small Git commits
    I have 45 commits.
x Your commit messages are meaningful
    Each commit has a message.
x You made the changes in a commit that relate to the commit message
    All commits relate to the change.
x You don't include changes in a commit that aren't related to the commit message
    Done!

PRIORITIZING:

ORMs and ActiveRecord Unit: Migrations, CRUD Intro, and Associations
1. Migrations are what we write to make changes to our database. Tells AR columns and tables.
2. The schema changes when we create a new table and run rake db:migrate
  Schema also changes when we update an existing table and run rake db:migrate.
3. Tux: how we access objects through ActiveRecord associations defined in our models. Can perform all CRUD operations through the terminal. 
Ex: User.first
=> <User id: 1, name: "Dahlia", email: "dahliabloomstone@gmail.com", password_digest: "$2a$12$4Xh
1lWMFNl9esGYzJ7LsvO5iULmnMZhbBiZYwOZOmK5...", created_at: "2020-07-20 21:40:03", updated_at: "20

A SESSION: an object, like a hash, that stores data describing a clients interactions with a website at a given point in time. When a user logs in, we store a USER ID in a session hash. the user id is stored as a value of session[:user_id]= for the whole session the app will know who the user is. 


MORE NOTES...
We inherit from ActiveRecord::Migration which allows for implementing basic CRUD actions using Sinatra. 

Why do we use password_digest? bcrypt. salts the passwords. encrypted passwords. -> has_secure_password. AR authenticate.
can just put password in the controllers and views. 

t.timestamps null :false gives me timestamps everytime we create or update a model. 

RESTFUL routes - app recieves HTTP request, introspects on that request and identifies HTTP method and URL, connects with a controller action that has that method and URL, executes code in that action, determines which response to send back to the client 

t.integer :user_id: has many and belongs to relationships/associations/active record macros 

logging the user in = creating the user session. enable the session in the application controller. 

Redirect = send a get request, separation of concerns - every route should have one job. So if we are in a post request, redirect to a get request so it does its one job and the get request does its one job. Render = happen from a get request.

action of a form = post request, http verb, creates something in the database, restful convention 

  get '/users/:slug ' do ... slug vs id 
 slug is often an instance method on the user 

