FactoryBot.define do
  factory :user do
    email { "emailprueba@THISPART.com" }
    name { "Javier Alonso" }
    auth_token { Faker::Config.random.seed}
  end
end
