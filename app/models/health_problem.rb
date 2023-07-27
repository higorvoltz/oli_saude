# frozen_string_literal: true

class HealthProblem < ApplicationRecord
  has_many :clients
  validates :name, presence: true
  validates :degree, presence: true
end
