# frozen_string_literal: true

require 'rails_helper'
require 'pry'

module Api
  module V1
    RSpec.describe HealthProblemsController, type: :controller do
      describe 'GET #index' do
        context 'with valid params' do
          let!(:health_problem) { create(:health_problem) }

          it 'returns status ok' do
            create_list(:health_problem, 3)
            get :index
            expect(response).to have_http_status(:ok)
          end

          it 'body matches factory bot health_problems' do
            get :index
            expect(response.body).to match(health_problem.to_json)
          end
        end

        context 'when there are no health problems' do
          it 'returns status not found' do
            get :index
            expect(response).to have_http_status(:not_found)
          end
        end
      end

      describe 'GET #show' do
        let!(:health_problem) { create(:health_problem) }

        context 'with valid params' do
          it 'returns status ok' do
            get :show, params: { id: health_problem.id }
            expect(response).to have_http_status(:ok)
          end

          it 'body matches factory bot health_problems' do
            get :show, params: { id: health_problem.id }
            expect(JSON.parse(response.body)).to eq(health_problem.as_json)
          end
        end
      end

      describe 'POST #create' do
        let!(:health_problem) { create(:health_problem) }

        context 'with valid params' do
          it 'returns status created' do
            post :create, params: { name: health_problem.name, degree: health_problem.degree }
            expect(response).to have_http_status(:created)
          end

          it 'returns the correct JSON response when the health problem is created' do
            post :create, params: { name: health_problem.name, degree: health_problem.degree }
            expect(JSON.parse(response.body)).to eq(HealthProblem.last.as_json)
          end
        end
      end

      describe 'PUT #update' do
        let!(:health_problem) { create(:health_problem) }

        context 'with valid id' do
          it 'returns status ok' do
            put :update, params: { id: health_problem.id, name: health_problem.name, degree: health_problem.degree }
            expect(response).to have_http_status(:ok)
          end
        end
      end

      describe 'DELETE #destroy' do
        let!(:health_problem) { create(:health_problem) }

        context 'with valid id' do
          it 'returns status ok' do
            delete :destroy, params: { id: health_problem.id }
            expect(response).to have_http_status(:ok)
          end
        end
      end
    end
  end
end
