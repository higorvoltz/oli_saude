# frozen_string_literal: true

class HealthProblemsController < ApplicationController
  def index
    @health_problems = HealthProblem.all
    if @health_problems.present?
      render json: @health_problems, status: :ok
    else
      render json: { error: 'Health problems not found' }, status: :not_found
    end
  end

  def show
    @health_problem = HealthProblem.find(params[:id])
    if @health_problem.present?
      render json: @health_problem, status: :ok
    else
      render json: { error: 'Health problem not found' }, status: :not_found
    end
  end

  def create
    @health_problem = HealthProblem.create!(health_problem_params)
    if @health_problem.present?
      render json: @health_problem, status: :created
    else
      render json: { error: 'Health problem not created' }, status: :unprocessable_entity
    end
  end

  def update
    @health_problem = HealthProblem.find(params[:id])
    if @health_problem.update(health_problem_params)
      render json: @health_problem, status: :ok
    else
      render json: { error: 'Health problem not updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    @health_problem = HealthProblem.find(params[:id])
    if @health_problem.destroy
      render json: { message: 'Health problem deleted' }, status: :ok
    else
      render json: { error: 'Health problem not deleted' }, status: :unprocessable_entity
    end
  end

  private

  def health_problem_params
    params.permit(:name, :degree)
  end
end
