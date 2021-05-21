# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Post
Post.create(title: "Luke Skywalker", content: "The Impulsive Kid")
Post.create(title: "Han Solo", content: "The Hot Shot")
Post.create(title: "Darth Vader", content: "The Sith Lord")
Post.create(title: "Millenium Falcon", content: "The fastest ship in the galaxy.")
Post.create(title: "Death Star", content: "Planet goes bye-bye")
Post.create(title: "Tatooine", content: "Deserts and stuff")

#Category
Category.create(name: "Character")
Category.create(name: "Starship")
Category.create(name: "Planet")

#User
User.create(username: "Bebop", email: "bebop@technodrome.com")
User.create(username: "Rocksteady", email: "rocksteady@technodrome.com")
User.create(username: "OldHob", email: "oldhob@mutanimals.com")

#Post Categories

#Comment
Comment.create(content: "Cool guy!", user_id: 1, post_id: 1)
Comment.create(content: "What a bum!", user_id: 2, post_id: 2)
Comment.create(content: "This dude terrifies me!", user_id: 3, post_id: 3)
Comment.create(content: "What an inspiration!", user_id: 2, post_id: 3)

