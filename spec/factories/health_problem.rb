# frozen_string_literal: true

FactoryBot.define do
  factory :health_problem do
    name { File.readlines('app/diseases_list/index.txt').sample.chomp.gsub("'", '') }
    degree { rand(1..100) }
  end
end
