FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "List ##{n}" }
    private false
    user nil
  end
end
