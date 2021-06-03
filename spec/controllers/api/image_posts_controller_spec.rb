# frozen_string_literal: true

RSpec.describe Api::ImagePostsController, type: :controller do
  let(:image_post) { create(:image_post) }

  describe '#index' do
    image_post
    get :index
    expect(ImagePost.count).to be 1
  end
end
