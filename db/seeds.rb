# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(email:"test@test.com",name:"test",encrypted_password:"test")
user2 = User.create!(email:"test2@test.com",name:"test2",encrypted_password:"test2")
user3 = User.create!(email:"test3@test.com",name:"test3",encrypted_password:"test3")

Event.create!( { [name:"Pleinfeest",location:"Plein",size:20,price:15.5,image_url:"https://i.ytimg.com/vi/TR6EpCaF1wg/maxresdefault.jpg",description:"feest op het plein",user:user1],
  [name:"Straatfeest",location:"Straat",size:10,price:10.5,image_url:"http://www.statenkwartier.net/wp-content/uploads/2012/08/Straatfeest-Van-der-Heimstraat1.jpg",description:"feest op de straat",user:user2],
  [name:"Kroegfeest",location:"Kroeg",size:15,price:5.5,image_url:"http://rever.nl/wp-content/uploads/2014/08/Bruine-kroeg-uitgelicht.jpg",description:"feest in de kroeg",user:user3],
}
)
