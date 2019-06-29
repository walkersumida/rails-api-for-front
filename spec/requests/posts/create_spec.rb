require 'rails_helper'

RSpec.describe 'POST /posts', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      title: 'title',
      body: 'body',
    }
  end
  let(:params) do
    { post: valid_attributes }
  end
  let(:post_obj) do
    Post.find(JSON.parse(response.body)['id'])
  end

  sign_in(:user)

  it 'get posts' do
    is_expected.to eq(201)

    expect(response.body).to be_json_as(
      {
        id: post_obj.id,
        user_id: post_obj.user_id,
        title: post_obj.title,
        body: post_obj.body,
        status: post_obj.status,
        created_at: post_obj.created_at,
        updated_at: post_obj.updated_at,
      }
    )
  end
end
