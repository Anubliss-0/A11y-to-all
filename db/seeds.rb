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

20.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,

  )
  user.save!
  profile = Profile.create(
    name: Faker::Name.name,
    bio: Faker::Stoked.bio,
    location: Faker::Address.country_by_code(code: "#{Faker::Address.country_code}"),
    user_name: ("#{Faker::Internet.username}#{rand(10..100)}"),
    user_id: user.id
  )
  file = URI.open("https://i.pravatar.cc/300")
  profile.photo.attach(io: file, filename:"filler.jpeg",content_type: "image/jpeg")
  profile.save!
end

40.times do
  tag = ProfileCategory.create(
    profile_id: rand(1..20),
    category_id: rand(1..8)
  )
  tag.save!
end

40.times do
  tool = Tool.create(
    title: ("#{Faker::Emotion.noun} #{Faker::Verb.base}er"),
    description: Faker::Restaurant.description,
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
    title: Faker::Job.key_skill,
    user_id: rand(1..20)
  )
  list.save!
end

50.times do
  bookmark = Bookmark.create(
    list_id: rand(1..20),
    tool_id: rand(1..30)
  )
  bookmark.save!
end

40.times do
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    user_id: rand(1..20),
    tool_id: rand(1..30)
  )
  review.save!
end
