require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #show' do
    before do
      get :show, id: transaction.id
    end

    let(:transaction) { Transaction.create(category: 'roshdy', price: 80000, sq__ft: 254) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'response with JSON body containing expected Transaction attributes' do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body).to match({ id: transaction.id, street: nil,
                                   price: 80000, city: nil, zip: nil, state:nil, beds: nil,
                                   baths: nil, sq__ft: 254, category: 'roshdy', sale_date: nil,
                                   latitude: nil, longitude: nil })
    end
  end
end
