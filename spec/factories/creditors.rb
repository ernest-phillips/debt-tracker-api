require 'faker'

FactoryBot.define do
  factory :creditor do
    name { Faker::Company.name }
    url { Faker::Internet.url } 
  end
end
