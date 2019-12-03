require 'rails_helper'

RSpec.describe UrlShortenerController, type: :controller do
    describe 'POST #url' do
      context 'With a valid url request' do
        it 'returns http success' do
          post :url, params: { }
          expect(response).to have_http_status(:success)
        end
    end
  end
end 
