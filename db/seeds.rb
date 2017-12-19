# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

User.create(username: "test", password: "test", password_confirmation: "test")
User.create(username: "test2", password: "test", password_confirmation: "test")
User.create(username: "test3", password: "test", password_confirmation: "test")

titles = [
  "20 JavaScript frameworks you are required to know in 2018",
  "The Trouble With Millenials",
  "This latest security whoopsie is a real doozie",
  "Assembling WebAssembly on the Web",
  "Linus Torvalds yells at someone, surprising no one",
  "Quantum Computing Hurts My Brain",
  "Bitcoin saves the world's economy and ends world hunger",
  "Zuck assures everyone that Facebook isn't an evil dystopian megacorporation",
  "Lessons learned from wasting 10 years of my life on a startup no one wanted",
  "New Study Confirms: Sarcastic Humour is Really Annoying."
]

titles.each do |title|
  Post.create(title: title, url: "http://google.ca", user: User.all.sample)
end

Post.all.each do |post|
  Comment.create(content: "I am happy about thing", post: post, user: User.all.sample)
  Comment.create(content: "I'm very mad about thing!", post: post, user: User.all.sample)
end
