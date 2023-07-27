# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(min_age: 1, max_age: 120) }
    sex { Faker::Gender.binary_type }
    health_problem
  end
end
