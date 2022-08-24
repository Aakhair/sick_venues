# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Venue.destroy_all

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    full_name: Faker::Name.name,
  )
  user.save!
end
puts '10 Users have been created!'


puts 'Creating 12 fake venues...'
title = ['Torre de Belém', 'Pena Palace', 'Castle of Santa Maria da Feira', 'Ribeira Palace', 'Castelo de São Jorge', 'Fontainebleu', 'Mont Saint-Michel', 'Sagrada de Familia', 'Château de Chambord', 'Palace of Versailles', 'Windsor Palace', 'Luxembourg Palace']
category = ['badass wedding', 'outdoor concert', 'epic birthday', 'messy graduation', 'dog lovers']

all_users = User.all

12.times do
  venue = Venue.new(
    title: title.sample,
    description: Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false),
    location: Faker::Address.full_address,
    capacity: rand(140..2400),
    category: category.sample,
    price: rand(800..10000),
    user: all_users.sample
  )
  venue.save!
end
puts '12 Venues have been created!'
