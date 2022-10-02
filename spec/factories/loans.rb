# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :loan do
    name { Faker::Company.buzzword }
    balance { Faker::Number.decimal(l_digits: 2) }
    min_payment { Faker::Number.decimal(l_digits: 2) }
    interest { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
    user { association :user }
    creditor { association :creditor }
  end
end
