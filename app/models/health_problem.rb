# frozen_string_literal: true

class HealthProblem < ApplicationRecord
  has_many :clients
end
