
FactoryBot.define do
  factory :user do
    email { "jim_#{Time.now.to_f}@example.com" }
    password "OneTwoThree4"
    first_name "Jhons"
    last_name "tomas"
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
