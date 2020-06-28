# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Category.create(name: "Pop Culture")
b = Category.create(name: "Music")
c = Category.create(name: "Politics")

d = Post.create(title: "R Kelly pees on ppl")
e = Post.create(title: "Donald Trump bombs North Korea")

f = Comment.create(content: "What is R kelly doing???!!")
g = Comment.create(content: "Donald Trump is awesome!!!")
j = Comment.create(content: "R Kelly is insane!!")

h = User.create(username: "Ilovemusic11")
i = User.create(username: "pickuptrucks22")

d.categories << a
d.comments << f
d.comments << j
d.save

e.categories << c
e.comments << g
e.save

f.user = h
f.save

j.user = h
j.save

g.user = i
g.save


