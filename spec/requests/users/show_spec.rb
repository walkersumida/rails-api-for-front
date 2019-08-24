require 'rails_helper'

RSpec.describe 'GET /users/:uuid', type: :request do
  let(:user) { create(:user) }

  sign_in(:user)

  context ':uuid param is uuid' do
    let(:uuid) { user.uuid }

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

  context ':uuid param is `me`' do
    let(:uuid) { 'me' }

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
end
