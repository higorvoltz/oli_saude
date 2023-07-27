# frozen_string_literal: true

require 'rails_helper'
require 'faker'

module Api
  module V1
    RSpec.describe ClientsController, type: :controller do
      describe 'GET #index' do
        context 'with valid params' do
          let!(:client) { create(:client) }

          it 'returns status ok' do
            create_list(:client, 3)
            get :index
            expect(response).to have_http_status(:ok)
          end

          it 'body matches factory bot client' do
            get :index
            expect(response.body).to match(client.to_json)
          end
        end

        context 'when there are no clients' do
          it 'returns status not found' do
            get :index
            expect(response).to have_http_status(:not_found)
          end
        end
      end

      describe 'GET #show' do
        let!(:client) { create(:client) }

        context 'with valid params' do
          it 'returns status ok' do
            get :show, params: { id: client.id }
            expect(response).to have_http_status(:ok)
          end

          it 'body matches factory bot client' do
            get :show, params: { id: client.id }
            expect(JSON.parse(response.body)).to eq(client.as_json)
          end
        end
      end

      describe 'POST #create' do
        let!(:client) { create(:client) }

        context 'with valid params' do
          it 'returns status created' do
            post :create, params: { name: client.name, birthdate: client.birthdate, sex: client.sex, health_problem_id: client.health_problem_id }
            expect(response).to have_http_status(:created)
          end

          it 'returns the correct JSON response when the client is created' do
            post :create, params: { name: client.name, birthdate: client.birthdate, sex: client.sex, health_problem_id: client.health_problem_id }
            expect(JSON.parse(response.body)).to eq(Client.last.as_json)
          end
        end
      end

      describe 'PUT #update' do
        let!(:client) { create(:client) }

        context 'with valid id' do
          it 'returns status ok' do
            put :update, params: { id: client.id, name: 'new name', birthdate: client.birthdate, sex: client.sex }
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe 'DELETE #destroy' do
        let!(:client) { create(:client) }

        context 'with valid id' do
          it 'returns status ok' do
            delete :destroy, params: { id: client.id }
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe 'GET #report_most_affected_clients' do
        let(:quantity) { 3 }
        let!(:health_problems) { create_list(:health_problem, quantity) }
        let(:health_problem_ids) { health_problems.pluck(:id) }
        let(:most_affected_clients) { create_list(:client, 3, health_problem_id: health_problem_ids) }

        context 'when most affected clients exist' do
          before do
            allow(Client).to receive(:where).with(health_problem_id: health_problem_ids).and_return(most_affected_clients)
          end

          it 'returns the most affected clients' do
            get :report_most_affected_clients, params: { quantity: }
            expect(response).to have_http_status(:ok)
          end
        end
      end
    end
  end
end
