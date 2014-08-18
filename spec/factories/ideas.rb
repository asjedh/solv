# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    sequence(:title) { |n| "Cool idea #{n}" }
    abstract "Awesome sauce idea"
    body "We should move to mars"

    user
  end
end
