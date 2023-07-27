# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Client, type: :model do
  context 'when saved' do
    let(:client) { create(:client) }

    it 'has a name field' do
      expect(client.name).to be_present
    end

    it 'has a birthdate field' do
      expect(client.birthdate).to be_present
    end

    it 'has a sex field' do
      expect(client.sex).to be_present
    end
  end
end
