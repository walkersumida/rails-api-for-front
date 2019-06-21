FactoryBot.define do
  sequence(:name) { |n| "Walker Sumida#{n}" }
  sequence(:email) { |n| "user#{n}@example.org" }
  sequence(:uuid) { |_n| SecureRandom.uuid }
  sequence(:access_token) { |_n| SecureRandom.uuid }
end
