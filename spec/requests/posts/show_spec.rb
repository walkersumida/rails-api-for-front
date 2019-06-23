require 'rails_helper'

RSpec.describe 'GET /posts/:id', type: :request do
  let(:id) { post.id }
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  sign_in(:user)

  it 'get posts' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        id: post.id,
        user_id: post.user_id,
        title: post.title,
        body: post.body,
        status: post.status,
        created_at: post.created_at,
        updated_at: post.updated_at
      }
    )
  end
end
