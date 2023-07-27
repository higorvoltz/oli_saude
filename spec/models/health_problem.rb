# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe HealthProblem, type: :model do
  context 'when saved' do
    let!(:health_problem) { create(:health_problem) }

    it 'has a name field' do
      expect(health_problem.name).to be_present
    end

    it 'has a degree field' do
      expect(health_problem.degree).to be_present
    end
  end
end
