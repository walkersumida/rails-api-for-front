require 'rails_helper'

RSpec.describe 'GET /posts', type: :request do
  sign_in(:user)
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  it 'get posts' do
    is_expected.to eq(200)

    expect(post).to eq(post)
  end
end
