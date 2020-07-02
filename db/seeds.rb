# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all
Category.destroy_all

users = User.create([
  {:username=>'aaa', :email=>'cc@bb.com'},
  {:username=>'bb', :email=>'c2c@bb.com'},
  {:username=>'cc', :email=>'c1c@bb.com'}])

posts = Post.create([
  {:title=> "Feeling Groovy", :content=> "I'm feeling so groovy"},
  {:title=> "Feeling Happy", :content=> "I'm feeling so happy"},
  {:title=> "Feeling Silly", :content=> "I'm feeling so Silly"},
  {:title=> "Feeling Windy", :content=> "I'm feeling so windy"}])

categories = Category.create([
  {:name=>"Cool"},
  {:name=>"Well"},
  {:name=>"Nice"},
  {:name=>"Great"}])
