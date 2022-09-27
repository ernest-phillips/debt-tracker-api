require 'faker'

FactoryBot.define do
  factory :loan do
    name { Faker::Company.name }
    balance { Faker::Number.decimal(l_digits: 2) }
    min_payment { Faker::Number.decimal(l_digits: 2) }
    interest { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
    creditor_id { Faker::Number.number(digits: 1) }
    user_id { Faker::Number.number(digits: 1) }
    user { association :user }
    creditor { association :creditor }
  end
end