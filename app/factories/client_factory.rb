# frozen_string_literal: true

class ClientFactory
  def self.create_client(params)
    Client.create!(params)
  end
end
