# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedies = Category.create!(name: "Comedies")
dramas = Category.create!(name: "Dramas")

futurama = Video.create!(title: "Futurama",
                         description: "Futurama is good",
                         cover_small_url: "/tmp/futurama.jpg",
                         cover_large_url: "/tmp/futurama_large.jpg",
                         category: comedies) 
monk = Video.create!(title: "Monk", 
                     description: "Monk is well",
                     cover_small_url: "/tmp/monk.jpg",
                     cover_large_url: "/tmp/monk_large.jpg",
                     category: dramas)
family_guy = Video.create!(title: "Family Guy",
                           description: "Family guy is well",
                           cover_small_url: "/tmp/family_guy.jpg",
                           cover_large_url: "/tmp/family_guy_large.jpg",
                           category: comedies)
south_park = Video.create!(title: "South Park",
                           description: "South Park is well",
                           cover_small_url: "/tmp/south_park.jpg",
                           cover_large_url: "/tmp/south_park_large.jpg",
                           category: comedies) 

futurama = Video.create!(title: "Futurama",
                         description: "Futurama is good",
                         cover_small_url: "/tmp/futurama.jpg",
                         cover_large_url: "/tmp/futurama_large.jpg",
                         category: comedies) 
monk = Video.create!(title: "Monk", 
                     description: "Monk is well",
                     cover_small_url: "/tmp/monk.jpg",
                     cover_large_url: "/tmp/monk_large.jpg",
                     category: dramas)
family_guy = Video.create!(title: "Family Guy",
                           description: "Family guy is well",
                           cover_small_url: "/tmp/family_guy.jpg",
                           cover_large_url: "/tmp/family_guy_large.jpg",
                           category: comedies)
south_park = Video.create!(title: "South Park",
                           description: "South Park is well",
                           cover_small_url: "/tmp/south_park.jpg",
                           cover_large_url: "/tmp/south_park_large.jpg",
                           category: comedies) 
south_park = Video.create!(title: "South Park",
                           description: "South Park is well",
                           cover_small_url: "/tmp/south_park.jpg",
                           cover_large_url: "/tmp/south_park_large.jpg",
                           category: comedies) 
