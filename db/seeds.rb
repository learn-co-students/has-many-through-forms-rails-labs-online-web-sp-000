# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Category.destroy_all
PostCategory.destroy_all
Post.destroy_all
Comment.destroy_all

tom = User.create(username: "Tom", email: "tom@tom.com")
james = User.create(username: "James", email: "james@james.com")
nicole = User.create(username: "Nicole", email: "nicole@nicole.com")

music = Category.create(name: "Music")
sports = Category.create(name: "Sports")
parenthood = Category.create(name: "Parenthood")
fashion = Category.create(name: "Fashion")
politics = Category.create(name: "Politics")
technology = Category.create(name: "Technology")
travel = Category.create(name: "Travel")
fitness = Category.create(name: "Fitness")
dating = Category.create(name: "Dating")

music_post = Post.create(title: "New Guitars", content: "New Guitars content content content")
sports_post = Post.create(title: "Sports are Starting", content: "Sports are Starting content content content")
parenthood_post = Post.create(title: "Parenthood Tips", content: "Parenthood Tips content content content")
fashion_post = Post.create(title: "Fashion Advice", content: "Fashion Advice content content content")
politics_post = Post.create(title: "Red vs Blue", content: "Red vs Blue content content content")
technology_post = Post.create(title: "New iPhones", content: "New iPhones content content content")
travel_post = Post.create(title: "Top 5 Destinations", content: "Top 5 Destinations content content content")
fitness_post = Post.create(title: "5 min Workout", content: "5 min Workout content content content")
dating_post = Post.create(title: "Dating Advice", content: "Dating Advice content content content")

music_comment = Comment.create(content: "cool guitars", user_id: tom.id, post_id: music_post.id)
another_music_comment = Comment.create(content: "really awesome guitars", user_id: tom.id, post_id: music_post.id)
james_music_comment = Comment.create(content: "not into it", user_id: james.id, post_id: music_post.id)

sports_comment = Comment.create(content: "awesome", user_id: james.id, post_id: sports_post.id)
parenthood_comment = Comment.create(content: "great_advice", user_id: nicole.id, post_id: parenthood_post.id)
fashion_comment = Comment.create(content: "i need it", user_id: tom.id, post_id: fashion_post.id)
politics_comment = Comment.create(content: "i disagree", user_id: james.id, post_id: politics_post.id)
technology_comment = Comment.create(content: "i want one", user_id: nicole.id, post_id: technology_post.id)
travel_comment = Comment.create(content: "can't travel right now", user_id: tom.id, post_id: travel_post.id)
fitness_comment = Comment.create(content: "i could write these articles", user_id: james.id, post_id: fitness_post.id)
dating_comment = Comment.create(content: "great article on dating", user_id: nicole.id, post_id: dating_post.id)

music_post_category = PostCategory.create(post_id: music_post.id, category_id: music.id)
sports_post_category = PostCategory.create(post_id: sports_post.id, category_id: sports.id)
parenthood_post_category = PostCategory.create(post_id: parenthood_post.id, category_id: parenthood.id)
fashion_post_category = PostCategory.create(post_id: fashion_post.id, category_id: fashion.id)
politics_post_category = PostCategory.create(post_id: politics_post.id, category_id: politics.id)
technology_post_category = PostCategory.create(post_id: technology_post.id, category_id: technology.id)
travel_post_category = PostCategory.create(post_id: travel_post.id, category_id: travel.id)
fitness_post_category = PostCategory.create(post_id: fitness_post.id, category_id: fitness.id)
dating_post_category = PostCategory.create(post_id: dating_post.id, category_id: dating.id)
