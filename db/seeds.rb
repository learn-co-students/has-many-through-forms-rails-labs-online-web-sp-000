# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "News")
Category.create(name: "Sports")
Category.create(name: "Science")

u = User.create(username: "Bill")
User.create(username: "Dave")

p = Post.create(title: "The titleee", content: "many things are said")

c = Comment.create(content: "i agree with that")

c.user = u

c.post = p

c.save

