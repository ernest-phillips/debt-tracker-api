require 'faker'

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end

    password { 'passworD1' }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
