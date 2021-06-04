# frozen_string_literal: true

require 'factory_bot'

def random_image
  Rack::Test::UploadedFile.new(Dir.glob("#{Rails.root}/spec/files/images/img_*").sample, 'image/png')
end

users = 3.times.map do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

posts = 3.times.map do
  ImagePost.create(header: Faker::Movies::StarWars.planet, image: random_image, user: users.sample)
end

posts.each do |post|
  3.times do
    Comment.create(content: Faker::Movies::StarWars.quote, image_post: post)
  end
end
