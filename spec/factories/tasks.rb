FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task ##{n}" }
    list nil
    done false
  end
end
