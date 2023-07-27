# frozen_string_literal: true

module Api
  module V2
    class HealthProblemsController < ApplicationController
      def index
        render json: health_problems_mediator.index, status: :ok
      end

      def show
        render json: health_problems_mediator.show(params[:id]), status: :ok
      end

      def create
        render json: health_problems_mediator.create(health_problem_params), status: :created
      end

      def update
        render json: health_problems_mediator.update(params[:id], health_problem_params), status: :ok
      end

      def destroy
        render json: health_problems_mediator.destroy(params[:id]), status: :ok
      end

      private

      def health_problem_params
        params.permit(:name, :degree)
      end

      def health_problems_mediator
        @health_problems_mediator ||= HealthProblemsMediator.new
      end
    end
  end
end
