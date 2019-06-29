FactoryBot.define do
  factory :user do
    uid { generate(:uuid) }
    email { generate(:email) }
    name { generate(:name) }
    password { '12345678' }
    confirmed_at { Time.now }
    confirmation_token { nil }
  end
end
