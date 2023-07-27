#  frozen_string_literal: true

module Api
  module V2
    class ClientsController < ApplicationController
      def index
        render json: clients_mediator.index, status: :ok
      end

      def show
        render json: clients_mediator.show(params[:id]), status: :ok
      end

      def create
        render json: clients_mediator.create(health_problem_params), status: :created
      end

      def update
        render json: clients_mediator.update(params[:id], health_problem_params), status: :ok
      end

      def destroy
        render json: clients_mediator.destroy(params[:id]), status: :ok
      end

      def report_most_affected_clients
        quantity = params[:quantity].to_i || 10
        mediator = MostAffectedClientsMediator.new(quantity)
        most_affected_clients = mediator.most_affected_clients

        if most_affected_clients.present?
          render json: most_affected_clients, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      private

      def client_params
        params.permit(:name, :birthdate, :sex, :health_problem_id)
      end

      def clients_mediator
        @clients_mediator ||= ClientsMediator.new
      end
    end
  end
end
