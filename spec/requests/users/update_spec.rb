require 'rails_helper'

RSpec.describe 'PATCH /users/:uuid', type: :request do
  let(:uuid) { user.uuid }
  let(:user) { create(:user, nickname: 'nickname') }
  let(:valid_attributes) do
    {
      nickname: updated_nickname,
    }
  end
  let(:params) do
    { user: valid_attributes }
  end
  let(:updated_nickname) { 'updated nickname' }

  sign_in(:user)

  it 'get user' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        id: user.uuid,
        email: user.email,
        name: user.name,
        nickname: updated_nickname,
        image: { url: nil },
      }
    )
  end
end
