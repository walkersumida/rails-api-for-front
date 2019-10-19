require 'rails_helper'

RSpec.describe 'POST /auth/sign_in', type: :request do
  let(:email) { user.email }
  let(:password) { 'password' }
  let(:user) { create(:user, password: password, nickname: 'nickname') }
  let(:valid_attributes) do
    {
      email: email,
      password: password,
    }
  end
  let(:params) do
    valid_attributes
  end

  it 'get user' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        id: user.uuid,
        email: user.email,
        name: user.name,
        nickname: user.nickname,
        image: { url: nil },
      }
    )
  end
end
