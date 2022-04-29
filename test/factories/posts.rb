FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { 
      if rand(2) == 0
        true
      else
        false
      end
     }
    user 
  end
end
