FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Bike #{n}" }
    description "fantastic bike"
    colour "red"
    Price "75"
  end
end
