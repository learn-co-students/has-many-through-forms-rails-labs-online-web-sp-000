# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "suspense")
Category.create(name: "humorous")
Category.create(name: "free form poetry")
Post.create(title: "how to run a mile", content: "you just run. stupid.")
Post.create(title: "how to be cher", content: "you cant.")
User.create(username: "beyonce", email: "beyonce@beyonce.com")
User.create(username: "charlizetheron", email: "charlizetheron@charlizetheron.com")