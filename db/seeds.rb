# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Category.new(name:"Reading").save!
Category.new(name:"Auditory").save!
Category.new(name:"Dyslexia").save!
Category.new(name:"Concentration").save!
Category.new(name:"Relaxation").save!
Category.new(name:"Autism Spectrum").save!
Category.new(name:"Visual").save!
Category.new(name:"Physical/Motor").save!
Category.new(name:"Neurological").save!
Category.new(name:"Cognitive").save!
Category.new(name:"Organization").save!

20.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
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
  3.times do
    tag = ProfileCategory.create(
      profile_id: profile.id,
      category_id: rand(1..11)
    )
    tag.save!
  end
  5.times do
    tool = Tool.create(
      title: ("#{Faker::Emotion.noun} #{Faker::Verb.base}er"),
      description: Faker::Restaurant.description,
      url: Faker::Internet.domain_name,
      rating: rand(1..5),
      user_id: user.id
    )
    file = URI.open("https://placeimg.com/440/280/tech")
    tool.photo.attach(io: file, filename:"filler.jpeg",content_type: "image/jpeg")
    tool.save!
    3.times do
      category = ToolCategory.create(
        category_id: rand(1..11),
        tool_id: tool.id
      )
      category.save!
    end
  end
  6.times do
    list = List.create(
      title: Faker::Job.key_skill,
      user_id: user.id
    )
    list.save!
  end
end

300.times do
  bookmark = Bookmark.create(
    list_id: rand(1..120),
    tool_id: rand(1..100)
  )
  bookmark.save!
end

150.times do
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    user_id: rand(1..20),
    tool_id: rand(1..100)
  )
  review.save!
end

300.times do
  friendship = Friendship.new(
    friend1_id: (1..10),
    friend2_id: rand(10..20)
  )
  friendship.save!
end
