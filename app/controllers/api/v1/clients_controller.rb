#  frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      def index
        @clients = ClientsFacade.get_all_clients
        if @clients.present?
          render json: @clients, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      def show
        @client = ClientsFacade.get_client(params[:id])
        if @client.present?
          render json: @client, status: :ok
        else
          render json: { error: 'Client not found' }, status: :not_found
        end
      end

      def create
        @client = ClientsFacade.create_client(client_params)
        if @client.present?
          render json: @client, status: :created
        else
          render json: { error: 'Client not created' }, status: :unprocessable_entity
        end
      end

      def update
        @client = ClientsFacade.update_client(params[:id], client_params)
        if @client.present?
          render json: @client, status: :ok
        else
          render json: { error: 'Client not updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        @client = ClientsFacade.delete_client(params[:id])
        if @client.destroy
          render json: { message: 'Client deleted' }, status: :ok
        else
          render json: { error: 'Client not deleted' }, status: :unprocessable_entity
        end
      end

      def report_most_affected_clients
        quantity = params[:quantity].to_i || 10
        most_affected_clients = ClientsFacade.get_most_affected_clients(quantity)

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
    end
  end
end
