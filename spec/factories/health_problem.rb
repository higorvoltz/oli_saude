# frozen_string_literal: true

FactoryBot.define do
  factory :health_problem do
    diseases = File.read('app/diseases_list/index.txt').split(',')
    name { diseases.sample.strip.gsub("'", '') }
    degree { rand(1..100) }
  end
end
