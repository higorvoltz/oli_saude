# frozen_string_literal: true

class MostAffectedClientsMediator
  def initialize(quantity)
    @quantity = quantity
  end

  def most_affected_clients
    most_problems = HealthProblem.order(degree: :desc).limit(@quantity)
    most_affected_clients = Client.where(health_problem_id: most_problems.pluck(:id))
    most_affected_clients
  end
end
