# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# un comment to delete the previous recored's
# User.destroy_all
# Venue.destroy_all
# puts "deleted the previos record's"

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


puts 'Creating 10 fake venues...'
title = ['Torre de Belém', 'Pena Palace', 'Castle of Santa Maria da Feira', 'Ribeira Palace', 'Castelo de São Jorge', 'Fontainebleu', 'Mont Saint-Michel', 'Sagrada de Familia', 'Château de Chambord', 'Palace of Versailles']
category = ['badass wedding', 'intense ravers', 'crazy hippies', 'outdoor concert', 'epic birthday', 'messy graduation', 'dangerous corporate outing', 'unshitty family reunion', 'dog lovers']

all_users = User.all

10.times do
  file = URI.open("https://source.unsplash.com/random/?medieval,castel")
  venue = Venue.new(
    title: title.sample,
    description: Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false),
    location: Faker::Address.full_address,
    capacity: rand(140..2400),
    category: category.sample,
    price: rand(800..10000),
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
end
puts '10 Venues have been created!'
