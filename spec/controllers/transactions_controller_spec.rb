require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #index ' do

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all the transactions' do
      @transaction = FactoryGirl.create(:transaction)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.last).to match('id'=> @transaction.id, 'street'=> nil, 'price'=>80000, 'city'=>nil, 'zip'=>nil, 'state'=>nil, 'beds'=>nil, 'baths'=>nil, 'sq__ft'=>254, 'category'=>'roshdy', 'sale_date'=>nil, 'latitude'=>nil, 'longitude'=>nil)
    end
  end

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

  describe 'POST #create' do
    it 'create transaction' do
     transaction_params = FactoryGirl.attributes_for(:transaction)
     expect { post :create, transaction: transaction_params }.to change(Transaction, :count).by(1)
   end
  end


  describe 'POST #update' do
    before :each do
      @transaction = FactoryGirl.create(:transaction)
      @incoming_params = { price: 80000, sq__ft: 254, category: 'roshdy' }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'updates price field' do
      @incoming_params[:id] = @transaction.id
      @incoming_params[:price] = 285
      patch :update
      @transaction.reload
      expect(@transaction.price).to eq (285)
    end
  end

  describe 'DELETE #destroy' do
    @transaction = Transaction.last
    context 'success' do
      it 'deletes the transaction' do
        expect { delete :destroy, id: @transaction }.to change(Transaction, :count).by(-1)

      end
    end
  end

end
