# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all

user1 = User.create!(email:"test1@test.com",name:"test1",password:"test01")
user2 = User.create!(email:"test2@test.com",name:"test2",password:"test02")
user3 = User.create!(email:"test3@test.com",name:"test3",password:"test03")

users = User.all
category1 = Category.create!(name:"outdoor",description:"No roof, dummy")
category2 = Category.create!(name:"indoor",description:"Roof, dummy")
category3 = Category.create!(name:"private",description:"No random people")
category4 = Category.create!(name:"public",description:"you can come if you got money")
date1 = Time.now
date2 = 2.days.from_now

Event.create!( [ {name:"Pleinfeest",location:"Plein",size:20,price:15.5,image_url:"https://i.ytimg.com/vi/TR6EpCaF1wg/maxresdefault.jpg",
  description:"feest op het plein",user:users.first,starts_at:date1,ends_at:date2,categories:[category1,category3]},
  {name:"Straatfeest",location:"Straat",size:10,price:10.5,image_url:"http://www.statenkwartier.net/wp-content/uploads/2012/08/Straatfeest-Van-der-Heimstraat1.jpg",
    description:"feest op de straat",user:users.second,starts_at:date1,ends_at:date2,categories:[category1,category4]},
  {name:"Kroegfeest",location:"Kroeg",size:15,price:5.5,image_url:"http://rever.nl/wp-content/uploads/2014/08/Bruine-kroeg-uitgelicht.jpg",
    description:"feest in de kroeg",user:users.third,starts_at:date1,ends_at:date2,categories:[category2,category4]},
{name:"Picnic", location:"park",size:4,price: 0,
  image_url:"https://thumb1.shutterstock.com/display_pic_with_logo/877126/134123828/stock-photo-group-of-young-attractive-friends-having-a-picnic-sitting-on-a-red-checked-cloth-on-green-grass-134123828.jpg",
  description:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", user:users.third,starts_at:date1,ends_at:date2,categories:[category2,category3]},
{name:"Big festival",location:"Hall",size:5000,price:0,image_url:"https://festileaks.com/wp-content/uploads/2017/04/LiquicityFestival_2.jpg",
  description:"A big frikkin festival",user:users.third,starts_at:date1,ends_at:date2,categories:[category1,category4]},
]
)
