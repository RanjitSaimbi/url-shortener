class UrlShortenerController < ApplicationController
  def url
    response = URLHandler.new(params[:url]).url
    if response
      render json: response, status: 200
    else
      render json: { 'url': 'Invalid URL provided, please try again.' }, status: 400
    end
  end

  def find_url
    url_found = URLHandler.new(params[:short_url]).found
    if url_found
      redirect_to url_found.url
    else
      render json: { 'url': 'URL not found.' }, status: 400
    end
  end
end
