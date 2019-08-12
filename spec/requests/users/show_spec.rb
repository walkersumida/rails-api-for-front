require 'rails_helper'

RSpec.describe 'GET /users/:uuid', type: :request do
  let(:uuid) { user.uuid }
  let(:user) { create(:user) }

  sign_in(:user)

  it 'get user' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        id: user.uuid,
        email: user.email,
        name: user.name,
        nickname: user.nickname,
        image: user.image,
      }
    )
  end
end
