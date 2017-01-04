# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

# Create Users
10.times do
  User.create!(
  username: RandomData.random_word,
  password: 123456
  )
end

# Create a test user
user1 = User.create!(
  username: 'user12',
  password: '123456'
)

# Create a second test user
user2 = User.create!(
  username: 'user13',
  password: '123456'
)

users = User.all

# Create Lists
15.times do
    List.create!(
        name: RandomData.random_words,
        user: users.sample,
        permissions: "hidden"
    )
end

lists = List.all

# Create Items
50.times do
    Item.create!(
        desc: RandomData.random_words,
        list: List.last,
        completed: false
    )
end

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
