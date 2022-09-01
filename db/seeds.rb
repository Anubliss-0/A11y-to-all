# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Category.new(name:"Reading").save!
Category.new(name:"Listening").save!
Category.new(name:"Dyslexia").save!
Category.new(name:"Concentration").save!
Category.new(name:"Relaxation").save!
Category.new(name:"Autism").save!
Category.new(name:"Text-readers").save!
Category.new(name:"Speech-Text").save!

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,

  )
  user.save!
  profile = Profile.create(
    # score: rand(1..100),
    name: Faker::Name.name,
    bio: "Hello I am a bio that is more than ten! This will be used to test our views.",
    location: Faker::Address.city,
    user_name: Faker::Internet.username,
    user_id: user.id
  )
  file = URI.open("https://i.pravatar.cc/300")
  profile.photo.attach(io: file, filename:"filler.jpeg",content_type: "image/jpeg")
  profile.save!
end

20.times do
  tag = ProfileCategory.create(
    profile_id: rand(1..10),
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
