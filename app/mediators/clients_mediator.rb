# frozen_string_literal: true

class ClientsMediator
  def index
    clients = Client.all
    clients.present? ? clients : { error: 'Clients not found' }
  end

  def show(id)
    client = Client.find(id)
    client.present? ? client : { error: 'Client not found' }
  end

  def create(params)
    client = Client.create!(params)
    client.present? ? client : { error: 'Client not created' }
  end

  def update(id, params)
    client = Client.find(id)
    if client.update(params)
      client
    else
      { error: 'Client not updated' }
    end
  end

  def destroy(id)
    client = Client.find(id)
    if client.present?
      client.destroy
      { message: 'Client deleted' }
    else
      { error: 'Client not deleted' }
    end
  end
end
