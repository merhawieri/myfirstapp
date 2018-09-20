
FactoryBot.define do
  sequence(:email) {|n| "user#{n}@gmail.com"}

  factory :user do
    email"ggtg@gmail.com"
    password "test123"
    first_name "John"
    last_name "Smith"
    admin false
  end

  factory :admin, class: User do
    email"ffdgf@gmail.com"
    password "test1d23"
    admin true
    first_name "efefr"
    last_name "ffr"
  end
end
