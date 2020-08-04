class User < ActiveRecord::Base
has_secure_password
validates :name, presence: true
validates :email, presence: true
validates :email, uniqueness: true

has_many :good_deeds

end


#bcrypt and has secure password 

# Why do we use the bcrypt gem and what is the significance of adding the password_digest column to the User model in the database?
# To avoid passwords from being stolen, the password is encrypted before stored in your database. This is done by bcrypt Ruby gem.
# The bcypt Ruby gem provides you with has_secure_password method. The has_secure_password method encrypts passwords by hashing and salting the passwords and generate ‘password_digest’.
# The has_secure_password method in turn gives you, #authenticate method, which you can use to authenticate passwords.
