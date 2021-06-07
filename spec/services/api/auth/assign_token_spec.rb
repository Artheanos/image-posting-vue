# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Auth::AssignToken do
  let(:user) { create(:user, password: password) }
  let(:password) { 'Password123' }
  let(:subject) { described_class.new(user.email, password) }
  let(:action) { subject.call }

  it 'returns valid token' do
    token = action
    user_id = Api::Auth::JsonWebToken.decode(token)[:user_id]
    expect(user_id).to eq user.id
  end
end
