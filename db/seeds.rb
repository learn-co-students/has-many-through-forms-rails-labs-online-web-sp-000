# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Category.create(name: "Lifestyle")
c2 = Category.create(name: "Future")
c3 = Category.create(name: "Past")
c4 = Category.create(name: "Present")

p1 = Post.create(title: "why coding is hard", content: "coding is hard")

u1 = User.create(username: "eloc4", email: "eloc@email.com")

u2 = User.create(username: "meme_man", email: "rickandmorty@memes.com")

comment1 = Comment.create(content: "problematic", user_id: 1, post_id: 1)
