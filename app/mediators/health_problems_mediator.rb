# frozen_string_literal: true

class HealthProblemsMediator
  def index
    health_problems = HealthProblem.all
    health_problems.present? ? health_problems : { error: 'Health problems not found' }
  end

  def show(id)
    health_problem = HealthProblem.find(id)
    health_problem.present? ? health_problem : { error: 'Health problem not found' }
  end

  def create(params)
    health_problem = HealthProblem.create!(params)
    health_problem.present? ? health_problem : { error: 'Health problem not created' }
  end

  def update(id, params)
    health_problem = HealthProblem.find(id)
    if health_problem.update(params)
      health_problem
    else
      { error: 'Health problem not updated' }
    end
  end

  def destroy(id)
    health_problem = HealthProblem.find(id)
    if health_problem.present?
      health_problem.destroy
      { message: 'Health problem deleted' }
    else
      { error: 'Health problem not deleted' }
    end
  end
end
