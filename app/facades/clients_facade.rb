# frozen_string_literal: true

class ClientsFacade
  def self.get_all_clients
    Client.all
  end

  def self.get_client(id)
    Client.find(id)
  end

  def self.create_client(params)
    ClientFactory.create_client(params)
  end

  def self.update_client(id, params)
    client = Client.find(id)
    client.update(params)
    client
  end

  def self.delete_client(id)
    client = Client.find(id)
    client.destroy
    client
  end

  def self.get_most_affected_clients(quantity = 10)
    most_problems = HealthProblem.order(degree: :desc).limit(quantity)
    most_affected_clients = Client.where(health_problem_id: most_problems.pluck(:id))
    most_affected_clients
  end
end
