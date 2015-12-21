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
             small_cover: "/tmp/futurama.jpg",
             large_cover: "/tmp/futurama_large.jpg",
             category: comedies,
             video_url: "https://youtu.be/0Qm07MUkgiA"
            ) 
monk = Video.create(title: "Monk", 
            description: "Monk is well",
            small_cover: "/tmp/monk.jpg",
            large_cover: "/tmp/monk_large.jpg",
            category: dramas, 
            video_url: "https://youtu.be/NG_lfqn5I1I"
            )
family_guy = Video.create(title: "Family Guy",
             description: "Family guy is well",
             small_cover: "/tmp/family_guy.jpg",
             large_cover: "/tmp/family_guy_large.jpg",
             category: comedies, 
             video_url: "https://youtu.be/1DjAnuS579k"
            )
south_park = Video.create(title: "South Park",
             description: "South Park is well",
             small_cover: "/tmp/south_park.jpg",
             large_cover: "/tmp/south_park_large.jpg",
             category: comedies,
             video_url: "https://youtu.be/lSMTVZ58fvc?t=31"
            ) 
futurama = Video.create(title: "Futurama",
             description: "Futurama is good",
             small_cover: "/tmp/futurama.jpg",
             large_cover: "/tmp/futurama_large.jpg",
             category: comedies,
             video_url: "https://youtu.be/0Qm07MUkgiA"
            ) 
monk = Video.create(title: "Monk", 
            description: "Monk is well",
            small_cover: "/tmp/monk.jpg",
            large_cover: "/tmp/monk_large.jpg",
            category: dramas, 
            video_url: "https://youtu.be/NG_lfqn5I1I"
            )
family_guy = Video.create(title: "Family Guy",
             description: "Family guy is well",
             small_cover: "/tmp/family_guy.jpg",
             large_cover: "/tmp/family_guy_large.jpg",
             category: comedies, 
             video_url: "https://youtu.be/1DjAnuS579k"
            )
south_park = Video.create(title: "South Park",
             description: "South Park is well",
             small_cover: "/tmp/south_park.jpg",
             large_cover: "/tmp/south_park_large.jpg",
             category: comedies,
             video_url: "https://youtu.be/lSMTVZ58fvc?t=31"
            ) 

zane = User.create!(
  full_name: "Zane Z",
  password: "password",
  email: "zane@example.com",
  admin: true
)
tim = User.create!(
  full_name: "Tim T",
  password: "password",
  email: "tim@example.com",
  admin: true
)
fox = User.create!(
  full_name: "fox T",
  password: "password",
  email: "fat.fox@gmail.com"
)

Review.create(user: zane, video: monk, rating: 5, content: "This is a really good movie!")
Review.create(user: zane, video: monk, rating: 2, content: "This is a horrible movie.!")
