# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
super_cute = Category.create(name: "Super Cute")
really_funny = Category.create(name: "Really Funny")

big_post = Post.create(title: "Big Post", content: "Lots of content")
little_post = Post.create(title: "Little Post", content: "Not a lot of content")

user1 = User.create(username: "Tom")
user2 = User.create(username: "Joe")

comment1 = Comment.create(content: "Really Cool!", user_id: 1, post_id: 1)
comment2 = Comment.create(content: "Awful post", user_id: 1, post_id: 2)
comment3 = Comment.create(content: "Great content!", user_id: 2, post_id: 1)
comment4 = Comment.create(content: "I take back what I said earlier", user_id: 1, post_id: 2)

big_post.categories << really_funny
little_post.categories << really_funny
little_post.categories << super_cute

