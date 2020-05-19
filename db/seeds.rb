# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
 
puts 'Cleaning database...'
User.destroy_all
Plug.destroy_all
 
puts 'Creating user...'
20.times do
  user = User.new(
    password: Faker::Internet.password,
    # first_name: Faker::Name.first_name,
    # last_name: Faker::Name.last_name,
    # phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email
  )
  user.save
  puts "User #{user.email} created"
 
  rand(1..3).times do
    plug = Plug.new(
      address: Faker::Address.full_address,
      power: [16, 30, 40, 70].sample,
      ac_dc: ["ac", "dc"].sample,
      type_plug: ["CHAdeMO", "CCS", "Type 2", "Tesla Type 2"].sample,
      price: rand(8..20)
    )
 
    plug.user = user
    plug.save
    puts "Plug \"#{plug.type_plug} - #{plug.power}\"created"
  end
end
 
puts "Finished!"