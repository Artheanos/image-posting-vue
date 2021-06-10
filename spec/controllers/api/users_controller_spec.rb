# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:json_response) do
    action
    JSON.parse(response.body)
  end
  # let(:author) { create(:user) }
  # let(:action_user) { author }
  # let(:image_post) { create(:image_post) }
  # let(:image_post_id) { image_post.id }

  describe '#show' do
    let(:action) { get :show, params: { id: user_id } }

    context 'when params are valid' do
      it 'returns a user' do
        expect(json_response).to include(
          'email' => user.email
        )
      end

      it 'returns ok status' do
        action
        expect(response).to have_http_status :ok
      end
    end

    context 'when user doesnt exist' do
      let(:user_id) { user.id + 1 }
      it 'doesnt return data' do
        expect(json_response).to eq({})
      end
      it 'returns not found status' do
        action
        expect(response).to have_http_status :not_found
      end
    end
  end
end
