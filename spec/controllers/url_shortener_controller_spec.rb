require 'rails_helper'

RSpec.describe UrlShortenerController, type: :controller do
  describe 'POST #url' do
    context 'with a valid url request' do
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

    context 'with an invalid url request' do
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

  describe 'GET #find_url' do
    url = URL.new('http://www.farmdrop.com')
    params = { short_url: url.short_url }
    bad_params = { short_url: 'nonsense' }

    context 'with a valid url request' do
      it 'redirects to url' do
        get :find_url, params: params
        expect(response).to redirect_to(url.url)
      end
    end

    context 'with an invalid url request' do
      it 'should return an invalid response' do
        get :find_url, params: bad_params
        expect(response.body).to include('URL not found.')
      end

      it 'returns http bad request' do
        get :find_url, params: bad_params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end

