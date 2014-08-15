# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John Brown"
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password "testing123"
  end
end
