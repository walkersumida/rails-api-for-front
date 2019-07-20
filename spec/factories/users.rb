FactoryBot.define do
  factory :login_user, class: User do
    uuid { SecureRandom.uuid }
    uid { generate(:uuid) }
    email { 'demo@xxx.com' }
    name { generate(:name) }
    password { 'demodemo' }
    confirmed_at { Time.now }
    confirmation_token { nil }

    factory :user do
      uid { generate(:uuid) }
      email { generate(:email) }
      name { generate(:name) }
    end
  end
end
