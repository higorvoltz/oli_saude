# frozen_string_literal: true

module Api
  module V1
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
        health_problem = HealthProblem.new(health_problem_params)
        health_problem_decorator = HealthProblemDecorator.new(health_problem)

        if health_problem_decorator.save
          render json: health_problem_decorator, status: :created
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
        if @health_problem.present?
          @health_problem.destroy
          render json: { message: 'Health problem deleted' }, status: :ok
        else
          render json: { error: 'Health problem not found' }, status: :not_found
        end
      end

      private

      def health_problem_params
        params.permit(:name, :degree)
      end
    end
  end
end
