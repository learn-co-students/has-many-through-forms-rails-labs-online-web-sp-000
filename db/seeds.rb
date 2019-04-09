# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'username1', email: 'username1@mail.com')
User.create(username: 'username2', email: 'username2@mail.com')

Category.create(name: 'category1')
Category.create(name: 'category2')

Post.create(title: 'title of first post', content: 'content of first post')
Post.create(title: 'title of second post', content: 'content of second post')

Comment.create(content: 'this is a comment on first post', user_id: 1, post_id: 1)
Comment.create(content: 'this is a comment on second post', user_id: 1, post_id: 2)
Comment.create(content: 'this is another comment on second post', user_id: 2, post_id: 2)

PostCategory.create(post_id: 1, category_id: 1)
PostCategory.create(post_id: 2, category_id: 2)
