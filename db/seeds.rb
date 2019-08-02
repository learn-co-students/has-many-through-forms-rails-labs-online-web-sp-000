# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


post1 = Post.create(title: "hello", content: "something")
post2 = Post.create(title: "bye", content: "blah blah")

category1 = Category.create(name: "science")
category2 = Category.create(name: "literature")

comment1 = Comment.create(content: "Awesome Post!", user_id: 2, post_id: 1)
comment1 = Comment.create(content: "Great!", user_id: 1, post_id: 2)

pc = PostCategory.create(post_id: 1, category_id: 1)
pc = PostCategory.create(post_id: 2, category_id: 2)

user1 = User.create(username:"Ella")
