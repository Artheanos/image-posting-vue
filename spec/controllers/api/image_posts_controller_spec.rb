# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ImagePostsController, type: :controller do
  let(:author) { create(:user) }
  let(:image_post) { create(:image_post, user: author) }
  let(:image_post_id) { image_post.id }
  let(:create_params) do
    {
      header: 'hello world',
      image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/images/img_1.jpg", 'image/png')
    }
  end
  let(:json_response) do
    action
    JSON.parse(response.body)
  end

  describe '#create' do
    it 'creates image_post' do
      http_login(author)
      post :create, params: { image_post: create_params }
      expect(ImagePost.first.as_json).to include('header' => 'hello world')
    end
  end

  describe '#index' do
    let(:index_params) { {} }
    let(:action) { get :index, params: index_params }

    context 'when you dont pass any params' do
      it 'lists image_posts in reverse order' do
        3.times { |i| create(:image_post, header: "header#{i}") }

        expect(json_response.first['header']).to eq 'header2'
        expect(json_response.last['header']).to eq 'header0'
      end

      it 'returns comment count' do
        create(:comment, image_post: image_post)
        create(:comment, image_post: image_post)

        expect(json_response.first['comment_count']).to eq 2
      end
    end

    context 'when you pass page number' do
      let(:index_params) { { page: 2 } }

      it 'returns proper posts' do
        10.times { |i| create(:image_post, header: "header#{i}") }
        expect(json_response.last['header']).to eq 'header0'
        expect(json_response.first['header']).to eq 'header4'
      end
    end

    context 'when you pass "after" param' do
      let(:index_params) { { after: ImagePost.find_by(header: 'header6').id } }
      it 'returns posts after header6 post in correct order' do
        10.times { |i| create(:image_post, header: "header#{i}") }
        expect(json_response.last['header']).to eq 'header7'
        expect(json_response.first['header']).to eq 'header9'
      end
    end
  end

  describe '#show' do
    let(:action) { get :show, params: { id: image_post_id } }

    context 'when params are valid' do
      it 'returns the image_post' do
        expect(json_response).to include('comments' => [])
      end
    end

    context 'when params are invalid' do
      let(:image_post_id) { image_post.id + 1 }

      it 'does not return the image_post' do
        expect(json_response).to eq({})
      end

      it 'returns not_found status' do
        json_response
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#destroy' do
    let(:action) { delete :destroy, params: { id: image_post_id } }
    before { image_post }

    context 'when params are valid' do
      before { http_login(author) }
      it 'deletes the image_post' do
        expect { action }.to change(ImagePost, :count).by(-1)
      end
    end

    context 'when action user is not the author' do
      let(:user) { create(:user) }
      before { http_login(user) }

      it 'does not delete the image_post' do
        expect { action }.not_to change(ImagePost, :count)
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
        expect { action }.not_to change(ImagePost, :count)
      end
    end
  end
end
