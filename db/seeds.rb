# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
30.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    chef_name: Faker::Name.name
  )
  restaurant.reviews << Review.create(
    rating: rand(1..5),
    content: Faker::Restaurant.review
  )

  puts "Created #{restaurant.name} reviewed 1 time"
end
puts "Finished!"
