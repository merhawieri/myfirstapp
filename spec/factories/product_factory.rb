FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Bike #{n}" }
    description "fantastic bike"
    colour "red"
    price "75"
  end
end
