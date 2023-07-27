#  frozen_string_literal: true

class ClientsController < ApplicationController
  def index
    @clients = Client.all
    if @clients.present?
      render json: @clients, status: :ok
    else
      render json: { error: 'Clients not found' }, status: :not_found
    end
  end

  def show
    @client = Client.find(params[:id])
    if @client.present?
      render json: @client, status: :ok
    else
      render json: { error: 'Client not found' }, status: :not_found
    end
  end

  def create
    @client = Client.create!(client_params)
    if @client.present?
      render json: @client, status: :created
    else
      render json: { error: 'Client not created' }, status: :unprocessable_entity
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.present?
      @client.update(client_params)
      render json: @client, status: :ok
    else
      render json: { error: 'Client not updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      render json: { message: 'Client deleted' }, status: :ok
    else
      render json: { error: 'Client not deleted' }, status: :unprocessable_entity
    end
  end

  def report_most_affected_clients
    quantity = params[:quantity].to_i || 10
    most_problems = HealthProblem.order(degree: :desc).limit(quantity)
    most_affected_clients = Client.where(health_problem_id: most_problems.pluck(:id))

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
