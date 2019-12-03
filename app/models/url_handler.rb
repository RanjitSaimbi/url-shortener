require 'open-uri'

class URLHandler
  def initialize(param)
    @param = param
  end

  def url
    parsed_url = parsed_url(@param)
    response_body(parsed_url)
  end

  def found
    URL.find(@param)
  end

  attr_accessor :param

  private

  def response_body(parsed_url)
    return nil unless valid_url(parsed_url)

    response_builder(parsed_url)
  end

  def response_builder(parsed_url)
    body = {}
    new_url = URL.new(parsed_url)
    body[:short_url] = new_url.short_url
    body[:url] = new_url.url
    body
  end

  def valid_url(url)
    open(url).status[0] == '200'
  rescue
    false
  end

  def parsed_url(url)
    u = URI.parse(url)
    return url if u.scheme

    'http://' + url
  end
end