# Here is where I will create some seed data to work with and test associations.

# Create 2 users

dahlia = User.create(name: "Dahlia", email: "dahliabloomstone@gmail.com", password: "password")
linda = User.create(name: "Linda", email: "Lindabloomstone@gmail.com", password: "password")

# Create some good deeds

GoodDeed.create(content: "I recycled.", user_id: dahlia.id)

# Use ActiveRecord to pre-associate data

dahlia.good_deeds.create(content: "I donated money!")

dahlias_entry = dahlia.good_deeds.build(content: "I donated more money!")
dahlias_entry.save
