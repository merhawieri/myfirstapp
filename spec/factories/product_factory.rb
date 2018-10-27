FactoryBot.define do
# Inside the block we define all factories for this file

  factory :product, class: Product do
    name {"bike"}
    description {"nice bike"}
    image_url {"https://placekitten.com/300/200"}
    colour {"blue"}
    price {42}
  end


  factory :comment do
    rating {5}
    body {"Great bike!"}
    user
  end
end
