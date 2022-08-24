# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


Venue.destroy_all
User.destroy_all

puts "deleted the previous records"

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

# filepath_descriptions = "db/seed-castle-descriptions.txt"
# descriptions = File.read(filepath_descriptions).split("\n")

descriptions = ["Four strong, square towers surround the castle in almost a perfect circle around this incredible castle and are connected by tall, firm walls made of black stone.",
                "Tall, wide windows are scattered thinly across the walls in a seemingly random pattern, along with small holes for archers and artillery.",
                "A sizable gate with huge metal doors, a regular bridge and various artillery equipment guards the only entrance to the castle build at the edges of a shoreline, but it's not the only way in, but it'll be your best shot if you wish to conquer this castle.",
                "Plain fields of a type of grass cover most of the fields outside of the castle, adding to the castle's aesthetics. This castle is relatively new, but so far it stood its ground with ease and it'll likely do so for ages to come.",
                "Six broad, round towers are low, but set firm and strong for a great defensive line and are connected by strengthened, massive walls made of dark green stone.",
                "Stylish windows are scattered thinly across the walls in an asymmetric pattern, along with overhanging crenelations for archers and artillery.",
                "A sizable gate with hefty metal doors and archer holes protects those in need of aid in this rough mountain pass and it's the only way in, at least without taking down the castle walls.",
                "Lush fields of crops surround the castle walls and provides the inhabitants with food all year round. This castle is relatively new, but so far it stood its ground with ease and it'll likely do so for ages to come.",
                "Thirteen broad, square towers are scattered in a seemingly random pattern, but have been build for an ideal defense and are connected by huge, wide walls made of dark brown stone.",
                "Small windows are scattered generously around the walls in fairly symmetrical patterns, along with overhanging crenelations for archers and artillery.",
                "A huge gate with large wooden doors and various artillery equipment offers a safe home to all those in need in these cold mountainsand it's the only way in, at least to those unfamiliar with the castle and its surroundings.",
                "A handful of waterfalls flow into various small rivers and provide the precious farm fields outside the castle with needed water. This castle has clearly been around for at least a thousand years, but it doesn't seem like it will collapse any time soon.",
                "Crude windows are scattered generously around the walls in fairly symmetrical patterns, along with symmetric holes for archers and artillery.",
                "A huge gate with wide wooden doors, a draw bridge and various artillery equipment guards the inhabitants of this island castle, but it's not the only way in, which fortunately only very few know.",
                "Huge statues of heroes and kings decorate the bridge outside, memories of glories of the past. This castle has stood the test of time and despite knowing some very rough times, the castle still stands and it looks like it will do so for many years to come."]


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
