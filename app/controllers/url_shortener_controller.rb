class URLShortenerController < ApplicationController
    def url
      response = URLHandler.new(params[:url]).url
      render json: response, status: 200
    end

    def find_url
      puts 'find url'
    end
end
