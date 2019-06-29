require 'rails_helper'

RSpec.describe 'DELETE /posts/:id', type: :request do
  let(:id) { post.id }
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  sign_in(:user)

  it 'get posts' do
    is_expected.to eq(204)

    expect(Post.find_by(id: post.id)).to eq(nil)
  end
end
