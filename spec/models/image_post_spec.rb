# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagePost, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:header).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
