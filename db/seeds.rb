@category = Category.create(name: "Cool")
@post = Post.create(title: "So Awesome", content: "Man am I a great blogger OR WHAT!")
@user = User.create(username: 'RealBigFish')


@post.categories << @category
@comment = Comment.create(content: "This was great!", user: @user, post: @post)

@post1 = Post.create(title: "Feeling Groovy", content: "I'm feeling so groovy")
@user1 = User.create(username: 'CoolGuy5')
@comment1 = @post1.comments.build(content: "Great Post!", user: @user1)
@post1.save
@comment2 = Comment.create(content: "And another thing, how come there aren't any vegetabls at the movie theater...", user: @user1, post: @post1)
