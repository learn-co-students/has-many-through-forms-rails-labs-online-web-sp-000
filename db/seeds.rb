# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Hash[[
  "Blues",
  "Classic Rock",
  "Country",
  "Dance",
  "Disco",
  "Funk",
  "Grunge",
  "Hip-Hop"
].map { |category| [category, Category.find_or_create_by(name: category)] }]

user = User.create(username: "TuckDog", email: "tdog@email.com")
user2 = User.create(username: "TroopDog", email: "trdog@email.com")

post = Post.create(title: "New post", content: "Great post content")
post2 = Post.create(title: "New post", content: "Great post content")

post.categories << Category.find(1)
post.categories << Category.find(2)

post2.categories << Category.find(3)
post2.categories << Category.find(4)

comment1 = Comment.new(content: "Great Post", user_id: 1)
comment2 = Comment.new(content: "Great Post", user_id: 1)

comment3 = Comment.new(content: "Great Post", user_id: 2)
comment4 = Comment.new(content: "Great Post", user_id: 2)
comment5 = Comment.new(content: "Still a Great Post", user_id: 2)

post.comments << comment1
post.comments << comment3
post2.comments << comment5
post2.comments << comment2
post2.comments << comment4
