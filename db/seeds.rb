# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.find_or_create_by(name: "Recipe")
Category.find_or_create_by(name: "Political")

User.find_or_create_by(username: "User 1")
User.find_or_create_by(username: "User 2")