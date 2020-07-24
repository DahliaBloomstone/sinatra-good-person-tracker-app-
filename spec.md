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
