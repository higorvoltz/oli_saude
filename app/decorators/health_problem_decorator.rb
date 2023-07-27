# frozen_string_literal: true

class HealthProblemDecorator
  def initialize(health_problem)
    @health_problem = health_problem
  end

  def save
    @health_problem.save!
  end

  def present?
    @health_problem.present?
  end

  def as_json(options = {})
    @health_problem.as_json(options)
  end
end
