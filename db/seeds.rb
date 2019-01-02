# Users create comments, not posts!
tuz = User.create(username: "tuzmusic", email: "tuzmusic@gmail.com")
hol = User.create(username: "holly", email: "holly@gmail.com")

ita = Post.create(title: "My trip to Italy", content: "Palermo was awesome!")
jap = Post.create(title: "My trip to Japan", content: "Kyoto was crazy!")

crowded = Comment.create(content:"And crowded!", user_id: tuz.id, post_id: jap.id)
fun = Comment.create(content:"But it was fun", user_id: hol.id, post_id: jap.id)
pasta = Comment.create(content:"Pasta Pasta Pasta", user_id: hol.id, post_id: ita.id)

trav = Category.create(name:"Travel")
food = Category.create(name:"Food")
weather = Category.create(name:"Weather")
europe = Category.create(name:"Europe")
asia = Category.create(name:"Asia")

PostCategory.create(post_id: jap.id, category_id: asia.id)
PostCategory.create(post_id: ita.id, category_id: europe.id)