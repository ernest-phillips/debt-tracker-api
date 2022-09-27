require 'faker'

FactoryBot.define do
  Faker::Company.name
  Faker::Internet.url
end
