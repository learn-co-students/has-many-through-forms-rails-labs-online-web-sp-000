# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post_1 = Post.create(title: "Feeling Groovy", content: "I'm feeling so groovy")
post_2 = Post.create(title: "Woot", content: "Woot Woot")
post_3 = Post.create(title: "Best Books Ever", content: "Pride & Prejudice, The Divine Comedy, Harry Potter")

user_1 = User.create(username: 'CoolGuy5')
user_2 = User.create(username: 'TestyLady')

post_1.categories.build(name: "Emotions")
post_2.categories.build(name: "Hype")
post_2.categories.build(name: "Exciting")
post_3.categories.build(name: "Top Lists")
post_3.categories.build(name: "Books")

Comment.create(content: "Great Post!", user: user_1, post: post_1)
Comment.create(content: "What is it, the 70s?", user: user_2, post: post_1)
Comment.create(content: "What about LOTR?", user: user_2, post: post_3)
Comment.create(content: "Jane Austen FTW!!", user: user_1, post: post_3)
Comment.create(content: "hell ya", user: user_1, post: post_2)