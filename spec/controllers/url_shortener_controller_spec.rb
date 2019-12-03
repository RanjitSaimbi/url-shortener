require 'rails_helper'

RSpec.describe URLShortenerController, type: :controller do
  describe 'POST #url' do
    context 'With a valid url request' do
      let(:request_body) { { 'url': 'http://www.farmdrop.com' } }

      it 'returns http success' do
        post :url, params: request_body
        expect(response).to have_http_status(:success)
      end

      it 'should return an valid response' do
        post :url, params: request_body
        expect(response.body).to include('http://www.farmdrop.com')
      end
    end

    context 'With an invalid url request' do
      let(:request_body) { { 'url': 'nonsense' } }

      it 'returns http bad request' do
        post :url, params: request_body
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return an invalid response' do
        post :url, params: request_body
        expect(response.body).to include('Invalid')
      end
    end
  end
end 
