# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(title: "hiking story", content: "long hike")
Post.create(title: "skiing story", content: "long ski run")
Post.create(title: "tennis story", content: "long tennis match")

User.create(username: "kev123", email: "kev@com")
User.create(username: "jon123", email: "jon@com")
User.create(username: "jeff123", email: "jeff@com")

Comment.create(content: "This is my favorite", user_id: 1, post_id: 1)
Comment.create(content: "This is pretty great", user_id: 2, post_id: 1)
Comment.create(content: "This is quite entertaining", user_id: 3, post_id: 2)

# create_table "posts", force: :cascade do |t|
#     t.string   "title"
#     t.string   "content"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "username"
#     t.string   "email"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

# end
