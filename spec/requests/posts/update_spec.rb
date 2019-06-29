require 'rails_helper'

RSpec.describe 'PATCH /posts/:id', type: :request do
  let(:id) { post.id }
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id, title: 'title') }
  let(:valid_attributes) do
    {
      title: updated_title,
    }
  end
  let(:params) do
    { post: valid_attributes }
  end
  let(:updated_title) { 'updated title' }

  sign_in(:user)

  it 'get posts' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        id: post.id,
        user_id: post.user_id,
        title: updated_title,
        body: post.body,
        status: post.status,
        created_at: post.created_at,
        updated_at: post.updated_at,
      }
    )
  end
end
