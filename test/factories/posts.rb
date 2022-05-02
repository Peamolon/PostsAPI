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

  factory :published_post, class: 'Post' do
    title { "El titulo post publicado" }
    content { "El contenido piblicado" }
    published { true }
    user 
  end

end
