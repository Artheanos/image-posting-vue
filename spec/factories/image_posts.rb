# frozen_string_literal: true

FactoryBot.define do
  factory :image_post do
    header { 'uga buga' }
    image { Rack::Test::UploadedFile.new(Dir.glob("#{Rails.root}/spec/files/images/img_*").sample, 'image/png') }
  end
end
