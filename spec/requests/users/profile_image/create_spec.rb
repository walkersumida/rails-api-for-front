require 'rails_helper'

RSpec.describe 'POST /users/:uuid/profile_image', type: :request do
  let(:user) { create(:user) }
  let(:uuid) { 'me' }
  let(:file_name) { 'user_icon.png' }
  let(:params) do
    { image: fixture_file_upload(file_fixture(file_name)) }
  end

  sign_in(:user)

  it 'upload profile image' do
    is_expected.to eq(200)

    expect(response.body).to be_json_as(
      {
        image: { url: "/uploads/user/image/#{user.uuid}/#{file_name}" },
      }
    )
  end
end
