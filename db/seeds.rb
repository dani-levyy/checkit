# This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'faker'
# # Examples:
require 'pg_search'
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 35 fake items...'
5.times do
  u = User.create!(
    email: Faker::Internet.free_email,
    password: "123456",
    first_name: Faker::Name.name,
    last_name: Faker::Name.name
  )
end

30.times do
  item = Item.new(
    name:    Faker::Food.ingredient,
    category: "Fruit",
    purchased: Time.now,
    expires:  Time.now + 365.days,
    user_id: rand(1..5)
  )
  item.save!
end

puts 'Finished!'
