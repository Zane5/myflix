# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedies = Category.create(name: "Comedies")
dramas = Category.create(name: "Dramas")

futurama = Video.create(title: "Futurama",
             description: "Futurama is good",
             small_cover: "futurama.jpg",
             large_cover: "futurama_large.jpg",
             category: comedies
            ) 
monk = Video.create(title: "Monk", 
            description: "Monk is well",
            small_cover: "monk.jpg",
            large_cover: "monk_large.jpg",
            category: dramas 
            )
family_guy = Video.create(title: "Family Guy",
             description: "Family guy is well",
             small_cover: "family_guy.jpg",
             large_cover: "family_guy_large.jpg",
             category: comedies 
            )
south_park = Video.create(title: "South Park",
             description: "South Park is well",
             small_cover: "south_park.jpg",
             large_cover: "south_park_large.jpg",
             category: comedies
            ) 

futurama = Video.create(title: "Futurama",
             description: "Futurama is good",
             small_cover: "futurama.jpg",
             large_cover: "futurama_large.jpg",
             category: comedies
            ) 
monk = Video.create(title: "Monk", 
            description: "Monk is well",
            small_cover: "monk.jpg",
            large_cover: "monk_large.jpg",
            category: dramas 
            )
family_guy = Video.create(title: "Family Guy",
             description: "Family guy is well",
             small_cover: "family_guy.jpg",
             large_cover: "family_guy_large.jpg",
             category: comedies 
            )
south_park = Video.create(title: "South Park",
             description: "South Park is well",
             small_cover: "south_park.jpg",
             large_cover: "south_park_large.jpg",
             category: comedies
            ) 
south_park = Video.create(title: "South Park",
             description: "South Park is well",
             small_cover: "south_park.jpg",
             large_cover: "south_park_large.jpg",
             category: comedies
            ) 

zane = User.create!(
  full_name: "Zane Z",
  password: "password",
  email: "zane@example.com"
)
tim = User.create!(
  full_name: "Tim T",
  password: "password",
  email: "tim@example.com"
)
fox = User.create!(
  full_name: "fox T",
  password: "password",
  email: "fat.fox@gmail.com"
)

Review.create(user: zane, video: monk, rating: 5, content: "This is a really good movie!")
Review.create(user: zane, video: monk, rating: 2, content: "This is a horrible movie.!")
