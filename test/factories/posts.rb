FactoryBot.define do
  factory :post do
    title { "El titulo" }
    content { "El contenido" }
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
