FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com" }
    password 'plataformatec123'
  end
end
