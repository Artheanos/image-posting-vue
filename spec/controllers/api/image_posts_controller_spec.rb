# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ImagePostsController, type: :controller do
  let(:author) { create(:user) }
  let(:image_post) { create(:image_post, user: author) }
  let(:image_post_id) { image_post.id }
  let(:create_params) do
    {
      header: 'hello world',
      image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/images/img_1.jpg", 'image/png'),
      user_id: author.id
    }
  end

  describe '#create' do
    it 'creates image_post' do
      http_login(author)
      post :create, params: { image_post: create_params }
      expect(ImagePost.first.as_json).to include('header' => 'hello world')
    end
  end

  describe '#index' do
    let(:json_response) do
      get :index
      JSON.parse(response.body)
    end

    it 'lists all image_posts' do
      create(:image_post, header: 'header1')
      create(:image_post, header: 'header2')
      create(:image_post, header: 'header3')

      expect(json_response.length).to eq 3
    end

    it 'returns comment count' do
      create(:comment, image_post: image_post)
      create(:comment, image_post: image_post)

      expect(json_response.first['comment_count']).to eq 2
    end
  end

  describe '#show' do
    let(:json_response) do
      get :show, params: { id: image_post_id }
      JSON.parse(response.body)
    end

    context 'when params are valid' do
      it 'returns the image_post' do
        expect(json_response).to include('comments' => [])
      end
    end

    context 'when params are invalid' do
      let(:image_post_id) { image_post.id + 1 }

      it 'does not return the image_post' do
        image_post
      end
    end
  end

  describe '#destroy' do
    let(:action) { delete :destroy, params: { id: image_post_id } }
    before { image_post }

    context 'when params are valid' do
      before { http_login(author) }
      it 'deletes the image_post' do
        expect { action }.to change { ImagePost.count }.by(-1)
      end
    end

    context 'when action user is not the author' do
      let(:user) { create(:user) }
      before { http_login(user) }

      it 'does not delete the image_post' do
        expect { action }.to change { ImagePost.count }.by 0
      end

      it 'returns unauthorized status' do
        action
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when params are invalid' do
      let(:image_post_id) { image_post.id + 1 }
      before { http_login(author) }

      it 'does not delete the image_post' do
        expect { action }.to change { ImagePost.count }.by 0
      end
    end
  end
end
