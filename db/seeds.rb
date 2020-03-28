# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 15 fake items...'
15.times do
  item = Item.new(
    name:    Faker::Food.ingredient,
    category: "Canned",
    purchased: Time.now,
    expires:  Time.now + 365.days,
    user_id: 1
  )
  item.save!
end
puts 'Finished!'
