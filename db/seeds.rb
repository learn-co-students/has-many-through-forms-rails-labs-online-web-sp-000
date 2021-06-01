# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = %w[Fashion
    Food 
    Travel
    Music
    Lifestyle
    Fitness
    DIY
    Sports]
    categories.each do |cat|
      Category.create({name: "#{cat}"})
    end

    User.create([{username: "John", email: "John@email.com"},
    {username:"Chris", email: "Chris@email.com"},
    {username:"Sam", email: "Sam@email.com"},
    {username:"Mark", email: "Mark@email.com"},
    {username:"Chet", email: "Chet@email.com"},
    {username:"Bill", email: "Bill@email.com"}])