# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Comment.destroy_all
User.destroy_all

natedogg = User.create(username: "natedogg")

post = Post.create(title: "New Post", content:"testestestestestest")
comment = post.comments.create(content: "great post!")
comment.user = natedogg
comment.save