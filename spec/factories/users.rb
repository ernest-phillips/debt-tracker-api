require 'faker'

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end

    Faker::Name.first_name
    Faker::Name.last_name

  end
end

  