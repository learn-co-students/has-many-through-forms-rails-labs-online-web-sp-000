cat1 = Category.create(name: "category 1")
cat2 = Category.create(name: "category 2")

post1 = Post.create(title: "First Post", content: "Interesting content for first post.")
post2 = Post.create(title: "Second Post", content: "Interesting content for second post.")
post3 = Post.create(title: "Third Post", content: "Interesting content for third post.")
post4 = Post.create(title: "Fourth Post", content: "Interesting content for Fourth post.")

post1.categories << cat1
post1.save
post2.categories << cat1
post2.save
post3.categories << cat2
post3.save
post4.categories << cat2
post4.save

user1 = User.create(username: "testuser1", email: "tu1@example.com")
user2 = User.create(username: "testuser2", email: "tu2@example.com")

Comment.create(content: "I like this post", user_id: user1.id, post_id: post1.id)
Comment.create(content: "So do I", user_id: user2.id, post_id: post1.id)
Comment.create(content: "I hate this post", user_id: user1.id, post_id: post2.id)
Comment.create(content: "I do not, I like it.", user_id: user2.id, post_id: post2.id)
Comment.create(content: "first user commenting on third post", user_id: user1.id, post_id: post3.id)
Comment.create(content: "second user commenting on fourth post", user_id: user2.id, post_id: post4.id)
