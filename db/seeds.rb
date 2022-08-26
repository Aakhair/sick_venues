# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Reservation.destroy_all
Venue.destroy_all
User.destroy_all

puts "deleted the previous records"

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'test12',
    full_name: Faker::Name.name,
  )
  user.save!
end
puts '10 Users have been created!'


puts 'Creating 12 fake venues...'
title = ['Torre de Belém', 'Pena Palace', 'Castle of Santa Maria da Feira', 'Ribeira Palace', 'Castelo de São Jorge', 'Fontainebleu', 'Mont Saint-Michel', 'Sagrada de Familia', 'Château de Chambord', 'Palace of Versailles', 'Windsor Palace', 'Luxembourg Palace']
category = ['badass wedding', 'outdoor concert', 'epic birthday', 'messy graduation', 'dog lovers']

all_users = User.all

filepath_descriptions = "db/seed-castle-descriptions.txt"
descriptions = File.read(filepath_descriptions).split("\n")

12.times do |index|
  file = URI.open("https://source.unsplash.com/random/?medieval,castel")

  venue = Venue.new(
    title: title.sample,
    description: descriptions[index],
    location: Faker::Address.full_address,
    capacity: rand(140..2400),
    category: category.sample,
    price: rand(800..10000),
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
end
puts '12 Venues have been created!'

file = URI.open("https://sc04.alicdn.com/kf/H480fc534e72940a8806e839ca191a613f.jpg")
  venue = Venue.new(
    title: "Bouncy Castle Deluxe",
    description: "You want to throw a party that your friends will remember? Go for our Jumping Castle Deluxe! A large inflatable structure, typically in the form of a stylized castle or other building, on which children can jump and play.",
    location: Faker::Address.full_address,
    capacity: 50,
    category: "epic birthday",
    price: 80,
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
  file = URI.open("https://www.lego.com/cdn/cs/set/assets/blt22e2e84fd35ab59d/43187_alt4.png")
  venue = Venue.new(
    title: "Rapunzel's Tower",
    description: "Looking for an secluded tower hidden deep within the woods outside of the kingdom of Corona? We found the perfect hidden treasure for you. The entrance is a little hard to reach but once in, you will stay forever.",
    location: Faker::Address.full_address,
    capacity: 2,
    category: "dangerous corporate outing",
    price: 500,
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
  file = URI.open("https://www.viajoteca.com/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2019/08/Passeio-de-1-dia-desde-Paris-22.jpg.webp")
  venue = Venue.new(
    title: "Mont Saint Michel",
    description: "Le Mont-Saint-Michel (pronounced [mɔ̃ sɛ̃ mi. ʃɛl]) is an island and commune in Normandy, France. It is in the Manche department. It is located about one kilometre (0.6 miles) from the country's northwestern coast.",
    location: "50170 Mont Saint-Michel, France",
    capacity: 1000,
    category: "badass wedding",
    price: 6500,
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
  file = URI.open("https://www.schloesser.bayern.de/bilder/schloss/neuschwanstein450.jpg")
  venue = Venue.new(
    title: "Neuschwanstein Castle",
    description: "Neuschwanstein Castle is a 19th-century historicist palace on a rugged hill above the village of Hohenschwangau near Füssen in southwest Bavaria, Germany. It needs some renovation, heating is not working, but perfect for a badass birthday party.",
    location: "Neuschwansteinstr. 20, 87645 Schwangau",
    capacity: 1500,
    category: "epic birthday",
    price: 7000,
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!
  # CATEGORIES = ['lonely ranger', 'badass wedding', 'intense ravers', 'crazy hippies', 'outdoor concert', 'epic birthday', 'messy graduation', 'dangerous corporate outing', 'unshitty family reunion', 'dog lovers']
  file = URI.open("https://c.pxhere.com/photos/de/96/heidelberg_castle_heidelberger_schloss_germany_building_architecture_ruin_facade-1218138.jpg!d")
  venue = Venue.new(
    title: "Broken Castle",
    description: "A little broken but with an unique style. Perfect for everyone with their own distinctive lifestyle and a sense of marginality. ",
    location: Faker::Address.full_address,
    capacity: 300,
    category: "crazy hippies",
    price: 700,
    user: all_users.sample
  )
  venue.photo.attach(io: file, filename: "castel.png", content_type: "image/png")
  venue.save!

  