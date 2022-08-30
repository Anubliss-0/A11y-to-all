# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Category.new(title:"Reading").save!
Category.new(title:"Listening").save!
Category.new(title:"Dyslexia").save!
Category.new(title:"Concentration").save!
Category.new(title:"Relaxation").save!
Category.new(title:"Autism").save!
Category.new(title:"Text-readers").save!
Category.new(title:"Speech-Text").save!

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,

  )
  user.save!
  profile = Profile.create(
    score: rand(1..100),
    name: Faker::Name.name,
    bio: "Hello I am a bio that is more than ten! This will be used to test our views.",
    location: Faker::Address.city,
    username: Faker::Internet.username,
    user_id: user.id
  )
  profile.save!
end

20.times do
  tag = UserCategory.create(
    user_id: rand(1..10),
    category_id: rand(1..8)
  )
  tag.save!
end

30.times do
  tool = Tool.create(
    title: Faker::Educator.course_name,
    description: "This is a fake tool to help test the views of our website.",
    url: Faker::Internet.domain_name,
    rating: rand(1..100),
    user_id: rand(1..10)
  )
  tool.save!
  category = ToolCategory.create(
    category_id: rand(1..8),
    tool_id: tool.id
  )
  category.save!
end

20.times do
  list = List.create(
    title: Faker::IndustrySegments.industry,
    user_id: rand(1..10)
  )
  list.save!
end

40.times do
  bookmark = Bookmark.create(
    list_id: rand(1..20),
    tool_id: rand(1..30)
  )
  bookmark.save!
end

20.times do
  review = Review.new(
    content: "This is content for a fake review. Hope you like it!",
    rating: rand(1..5),
    user_id: rand(1..10),
    tool_id: rand(1..30)
  )
  review.save!
end
